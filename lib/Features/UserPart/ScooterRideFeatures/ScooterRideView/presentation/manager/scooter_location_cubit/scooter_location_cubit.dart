import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/location_service.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/scooter_request_cubit/scooter_request_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/FindingRideView.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/data/models/RouteInfoModel.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/functions/RoutesUtlis.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/ride_price_cubit/ride_price_cubit.dart';

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

  Future<void> selectedLocation(BuildContext context,
      {required String description}) async {
    try {
      emit(ScooterLocationLoading()); // Emitting a loading state

      // Fetch the location from the address
      List<Location> locations = await locationFromAddress(description);
      if (locations.isNotEmpty) {
        Location dstLocation = locations.first;
        LatLng destination =
            LatLng(dstLocation.latitude, dstLocation.longitude);
        bool isInBound =
            checkPositionBounds(postition: destination, isDst: true);
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
        RouteInfo routeInfo = await routesUtils.getRouteData(
            desintation: destination, src: currentposition!);

        polyLines = routesUtils.displayRoute(routeInfo.points,
            polyLines: polyLines, googleMapController: googleMapController!);
        if (!context.mounted) return;
        BlocProvider.of<RidePriceCubit>(context)
            .getPrices(distance: routeInfo.distance);

        var userRequestModel =
            BlocProvider.of<ScooterRequestCubit>(context).userRequest;
        userRequestModel.location =
            "${locationDetails!.administrativeArea} ${locationDetails!.name} ${locationDetails!.thoroughfare}";
        userRequestModel.destination = description;
        userRequestModel.dstLat = destination.latitude.toString();
        userRequestModel.dstLng = destination.longitude.toString();
        userRequestModel.srcLat = currentposition!.latitude.toString();
        userRequestModel.srcLng = currentposition!.longitude.toString();
        var requesCubit = BlocProvider.of<ScooterRequestCubit>(context);
        await requesCubit.connect();
        await requesCubit.joinGroup(groupName: userGroup);
        emit(ScooterLocationChange(polyLines: polyLines, markers: markers));
      } else {
        emit(const ScooterLocationFailuer(errmsg: "No location found"));
      }
    } catch (e) {
      log("Error fetching location: $e");
      emit(const ScooterLocationFailuer(errmsg: "Failed to fetch location"));
    }
  }

/////////////////////////////////////////////////////////////////////////
  void getLocationDetails() {
    emit(ScooterLocationGetLocation(locationData: locationDetails!));
  }

  void onRequestSend(BuildContext context) {
    emit(ScooterLocationInitial());
    emit(ScooterLocationChange(
        polyLines: polyLines, markers: markers, isSent: true));
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return FindingRideView();
      },
    );
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
  void handleCameraMove({required CameraPosition position}) async {
    // emit(ScooterLocationInitial());
    LatLng newLocation = position.target;
    currentposition = newLocation;
    locationDetails = await defineLocationDetails(location: newLocation);
    log(locationDetails!.toJson().toString());
    // setMyLocationMark(newLocation);
  }

  ///////////////////////////////////////////////////////////
  void setMyCameraPosition(LatLng locationData) {
    var camerPosition = CameraPosition(target: locationData, zoom: 15);
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
        marker.markerId.value == 'my_location_marker');

    // Add a new marker for the searched location
    markers.add(
      Marker(
          markerId: const MarkerId('searched_location_marker'),
          position: locationData),
    );

    // Emit a new state with updated location data and markers
    // emit(ScooterLocationChange(
    //   // locationData: locationData,
    //   markers: markers,
    // ));
  }

  ////////////////////////////////////////////////////////////////

  void setMapController(GoogleMapController controller) {
    googleMapController = controller;
  }

  void setInitialState() {
    emit(ScooterLocationInitial());
    updateMyLocation();
  }

  DraggableScrollableController dragcontroller =
      DraggableScrollableController();
  void openRiderType() {
    dragcontroller.animateTo(
      100, // This will collapse the sheet
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}
