import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/location_service.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/scooter_request_cubit/UserRidRequestCubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/send_request_cubit/send_request_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/FindingRideView.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/data/models/RouteInfoModel.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/functions/RoutesUtlis.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/ride_price_cubit/ride_price_cubit.dart';
import 'dart:ui' as ui;

part 'scooter_location_state.dart';

class ScooterLocationCubit extends Cubit<ScooterLocationState> {
  ScooterLocationCubit(this.locationService, this.routesUtils)
      : super(ScooterLocationInitial());
  final LocationService locationService;
  final RoutesUtils routesUtils;

  GoogleMapController? googleMapController;
  Set<Marker> markers = {};
  Placemark? locationDetails;
  LatLng? currentposition;
  Set<Polyline> polyLines = {};
  bool isMoved = false;

  LatLng? newposition;
  StreamSubscription<DatabaseEvent>? _driversSubscription;
  Future<BitmapDescriptor> getIcon({required String assetName}) async {
    final ByteData data = await rootBundle.load(assetName);
    final ui.Codec codec = await ui
        .instantiateImageCodec(data.buffer.asUint8List(), targetWidth: 100);
    final ui.FrameInfo fi = await codec.getNextFrame();
    final ByteData? resizedData =
        await fi.image.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(resizedData!.buffer.asUint8List());
  }

  CameraTargetBounds appCamerabounds = CameraTargetBounds(LatLngBounds(
    southwest: const LatLng(29.994944894366228, 31.28310130035875),
    northeast: const LatLng(30.01648441913699, 31.345784740707476),
  ));

  void getMyCurrentPosition() async {
    await locationService.checkAndRequestLocationService();
    var hasPermission =
        await locationService.checkAndRequestLocationPermission();
    if (hasPermission) {
      currentposition = await locationService.getCurrentLocationData();
      locationDetails = await defineLocationDetails(location: currentposition!);
      checkPositionBounds(postition: currentposition!);
      // getLocationDetails();
    }
  }

  bool checkPositionBounds({required LatLng postition, bool isDst = false}) {
    String msg;
    if (!appCamerabounds.bounds!.contains(postition)) {
      // emit(ScooterLocationInitial());
      if (isDst) {
        msg =
            "Your destination is outside the allowed area. We are comming soon.";
      } else {
        msg =
            "Your current location is outside the allowed area. We are comming soon.";
      }
      // emit(ScooterLocationFailuer(errmsg: msg));
      return false;
    } else {
      return true;
    }
  }

  void updateMyLocation() async {
    await locationService.checkAndRequestLocationService();
    var hasPermission =
        await locationService.checkAndRequestLocationPermission();
    if (hasPermission) {
      currentposition = await locationService.getCurrentLocationData();
      locationDetails = await defineLocationDetails(location: currentposition!);
      // setMyLocationMark(currentposition!);

      setMyCameraPosition(currentposition!);
      checkPositionBounds(postition: currentposition!);
    }
  }

  void selectedCurrentLocation({required String description}) async {
    try {
      // Fetch the location from the address
      List<Location> locations = await locationFromAddress(description);
      if (locations.isNotEmpty) {
        Location location = locations.first;
        currentposition = LatLng(location.latitude, location.longitude);
        checkPositionBounds(postition: currentposition!);
      } else {
        emit(const ScooterLocationFailuer(errmsg: "No location found"));
      }
    } catch (e) {
      log("Error fetching location: $e");
      emit(const ScooterLocationFailuer(errmsg: "Failed to fetch location"));
    }
  }

  void cancelListening() {
    if (_driversSubscription != null) {
      _driversSubscription!.cancel();
      _driversSubscription =
          null; // Set to null to ensure it is not used after cancellation
    }
  }

  void listenToDriverLocationUpdates({required String driverId}) async {
    emit(ScooterLocationLoading());
    cancelListening();
    DatabaseReference driversRef =
        FirebaseDatabase.instance.ref('drivers/$driverId');
    _driversSubscription = driversRef.onValue.listen((event) async {
      if (event.snapshot.value != null) {
        emit(ScooterLocationLoading());

        final data = event.snapshot.value as Map<dynamic, dynamic>;
        final newLatitude = data['CurrentLatitude'] as double;
        final newLongitude = data['CurrentLongitude'] as double;

        newposition = LatLng(newLatitude, newLongitude);
        await setDriverMark(newposition!);
        log("new position: $newposition");

        RouteInfo routeInfo = await getRoute(newposition!);
        emit(ScooterLocationChange(
            polyLines: polyLines,
            markers: markers,
            duration: routeInfo.duration));
      }
    });
  }

  Future<void> selectedLocation(BuildContext context,
      {required String description}) async {
    try {
      emit(ScooterLocationLoading());
      var priceCubit = BlocProvider.of<RidePriceCubit>(context);
      var userRequestModel =
          BlocProvider.of<SendRequestCubit>(context).requestModel;
      // Fetch the location from the address
      List<Location> locations = await locationFromAddress(description);
      if (locations.isNotEmpty) {
        Location dstLocation = locations.first;
        LatLng destination =
            LatLng(dstLocation.latitude, dstLocation.longitude);
        // bool isInBound =
        //     checkPositionBounds(postition: destination, isDst: true);
        // if (isInBound) {
        //   setSearchedLocationMark(destination);

        //   // Fetch the route data
        //   List<LatLng> points = await routesUtils.getRouteData(
        //       desintation: destination, src: currentposition!);

        //   // Display the route on the map
        //   polyLines = routesUtils.displayRoute(points,
        //       polyLines: polyLines, googleMapController: googleMapController!);

        //   emit(ScooterLocationChange(polyLines: polyLines, markers: markers));
        // }
        setSearchedLocationMark(destination);

        // Fetch the route data
        RouteInfo routeInfo = await getRoute(destination);
        priceCubit.getPrices(distance: routeInfo.distance);

        userRequestModel.location =
            "${locationDetails!.administrativeArea} ${locationDetails!.name} ${locationDetails!.thoroughfare}";
        userRequestModel.destination = description;
        userRequestModel.dstLat = destination.latitude;
        userRequestModel.dstLng = destination.longitude;
        userRequestModel.srcLat = currentposition!.latitude;
        userRequestModel.srcLng = currentposition!.longitude;

        emit(ScooterLocationChange(polyLines: polyLines, markers: markers));
      } else {
        emit(const ScooterLocationFailuer(errmsg: "No location found"));
      }
    } catch (e) {
      log("Error fetching location: $e");
      emit(const ScooterLocationFailuer(errmsg: "Failed to fetch location"));
    }
  }

  Future<RouteInfo> getRoute(LatLng destination) async {
    RouteInfo routeInfo = await routesUtils.getRouteData(
        desintation: destination, src: currentposition!);

    polyLines = routesUtils.displayRoute(routeInfo.points,
        polyLines: polyLines, googleMapController: googleMapController!);
    return routeInfo;
  }

/////////////////////////////////////////////////////////////////////////
  void getLocationDetails() {
    emit(ScooterLocationGetLocation(locationData: locationDetails!));
  }

////////////////////////////////////////////////////////////////////////////
  Future<Placemark> defineLocationDetails({required LatLng location}) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(location.latitude, location.longitude);

      if (placemarks.isNotEmpty) {
        Placemark locationDetails = placemarks.first;
        return locationDetails;
      } else {
        return const Placemark(
          name: '',
          locality: '',
          subLocality: '',
          administrativeArea: '',
          postalCode: '',
          country: '',
        );
      }
    } catch (e) {
      return const Placemark(
        name: '',
        locality: '',
        subLocality: '',
        administrativeArea: '',
        postalCode: '',
        country: '',
      );
    }
  }

////////////////////////////////////////////////////////////////////
  // void handleCameraMove({required CameraPosition position}) async {
  //   // emit(ScooterLocationInitial());
  //   LatLng newLocation = position.target;
  //   currentposition = newLocation;
  //   locationDetails = await defineLocationDetails(location: newLocation);
  //   log(locationDetails!.toJson().toString());
  //   // setMyLocationMark(newLocation);
  // }

  ///////////////////////////////////////////////////////////
  void setMyCameraPosition(LatLng locationData) {
    var camerPosition = CameraPosition(target: locationData, zoom: 19);
    googleMapController
        ?.animateCamera(CameraUpdate.newCameraPosition(camerPosition));
    if (!isClosed) {
      emit(
          ScooterLocationSuccess(locationData: locationData, markers: markers));
    }
  }

  // void setMyLocationMark(LatLng locationData) {
  //   markers.removeWhere((marker) =>
  //       marker.markerId.value == 'searched_location_marker' ||
  //       marker.markerId.value == 'my_location_marker');
  //   markers.add(
  //     Marker(
  //       markerId: const MarkerId('my_location_marker'),
  //       position: locationData,
  //     ),
  //   );
  //   emit(ScooterLocationChange(markers: markers));
  //   // emit(ScooterLocationSuccess(locationData: locationData, markers: markers));
  // }

//////////////////////////////////////////////////////////////////
  void setSearchedLocationMark(LatLng locationData) {
    // Remove the existing searched location marker if it exists
    markers.removeWhere((marker) =>
        marker.markerId.value == 'searched_location_marker' ||
        marker.markerId.value == 'driver_mark');

    // Add a new marker for the searched location
    markers.add(
      Marker(
          markerId: const MarkerId('searched_location_marker'),
          position: locationData),
    );
  }

  Future<void> setDriverMark(LatLng locationData) async {
    // Remove the existing searched location marker if it exists
    markers.removeWhere((marker) => marker.markerId.value == 'driver_mark');

    // Add a new marker for the searched location
    markers.add(
      Marker(
          markerId: const MarkerId('driver_mark'),
          position: locationData,
          icon: await getIcon(assetName: Assets.imagesDriverMarker)),
    );
  }

  ////////////////////////////////////////////////////////////////

  void setMapController(GoogleMapController controller) {
    googleMapController = controller;
  }

  void setInitialState() {
    // await _driversSubscription?.cancel();
    markers.removeWhere((marker) => marker.markerId.value == 'driver_mark');
    emit(ScooterLocationInitial());
    updateMyLocation();
  }
}
