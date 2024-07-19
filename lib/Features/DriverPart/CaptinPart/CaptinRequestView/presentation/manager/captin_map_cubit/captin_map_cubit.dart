import 'dart:async';
import 'dart:developer';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/location_service.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/manager/captin_ride_request_cubit/captin_ride_request_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/data/models/RouteInfoModel.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/functions/RoutesUtlis.dart';

part 'captin_map_state.dart';

class CaptinMapCubit extends Cubit<CaptinMapState> {
  CaptinMapCubit(this.locationService, this.routesUtils)
      : super(CaptinMapInitial());
  final LocationService locationService;
  final RoutesUtils routesUtils;
  GoogleMapController? googleMapController;
  Set<Marker> markers = {};
  Placemark? locationDetails;
  LatLng? currentposition, newposition;
  bool isMoved = false;
  Set<Polyline> polyLines = {};
  bool isStarted = false;
  bool isFinished = false;
  StreamSubscription<DatabaseEvent>? _driversSubscription;

  // LatLng? test;
  Future<BitmapDescriptor> getIcon({required String assetName}) async {
    final ByteData data = await rootBundle.load(assetName);
    final ui.Codec codec = await ui
        .instantiateImageCodec(data.buffer.asUint8List(), targetWidth: 230);
    final ui.FrameInfo fi = await codec.getNextFrame();
    final ByteData? resizedData =
        await fi.image.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(resizedData!.buffer.asUint8List());
  }

  // Add a reference to the Firebase Realtime Database
  final DatabaseReference _driversRef = FirebaseDatabase.instance
      .ref('drivers/7a100182-0666-4486-601e-08dc9a154717');

  @override
  Future<void> close() async {
    // Cancel any active subscriptions when the cubit is closed
    return super.close();
  }

  void cancelListening() async {
    await _driversSubscription?.cancel();
  }

  void updateMyLocation(BuildContext context) async {
    await locationService.checkAndRequestLocationService();
    var hasPermission =
        await locationService.checkAndRequestLocationPermission();
    if (hasPermission) {
      currentposition = await locationService.getCurrentLocationData();
      setMyCameraPosition(currentposition!);
      emit(CaptinMapSuccess(locationData: currentposition!, markers: markers));
      isMoved = true;
    }
  }

  void listenToDriverLocationUpdates(BuildContext context) async {
    _driversSubscription = _driversRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        final data = event.snapshot.value as Map<dynamic, dynamic>;
        final newLatitude = data['CurrentLatitude'] as double;
        final newLongitude = data['CurrentLongitude'] as double;

        newposition = LatLng(newLatitude, newLongitude);
        log("new position: $newposition");
        // Update the driver's marker position on the map
        // updateDriverMarker(newposition!);

        currentposition = newposition;
        // setMyCameraPosition(currentposition!);

        // // Update the route whenever the driver's location changes
        getRoutes(context);
      }
    });
  }

  Future<void> updateDriverMarker(LatLng newLocation) async {
    emit(CaptinMapInitial());
    markers.removeWhere((marker) => marker.markerId.value == 'driver_marker');

    markers.add(
      Marker(
        markerId: const MarkerId('driver_marker'),
        position: newLocation,
        infoWindow: const InfoWindow(title: 'Driver Location'),
        icon: await getIcon(assetName: Assets.imagesDriverMarker),
      ),
    );

    // emit(CaptinMapChange(currentLtLng: newLocation, markers: markers));
  }

  Future<void> getRoutes(BuildContext context) async {
    emit(CaptinMapInitial());
    LatLng dist;
    var requestCubit =
        BlocProvider.of<CaptinRideRequestCubit>(context).detailsModel;
    if (isStarted) {
      double lat = requestCubit.dstLatitude;
      double lng = requestCubit.dstLongitude;
      dist = LatLng(lat, lng);
      markers.removeWhere(
          (marker) => marker.markerId.value == 'user_location_marker');
      setdistLocation(dist);
    } else {
      double lat = requestCubit.currentLatitude;
      double lng = requestCubit.currentLongitude;
      dist = LatLng(lat, lng);
      await setUserLocation(dist);
    }

    await updateDriverMarker(currentposition!);

    try {
      RouteInfo routeInfo = await routesUtils.getRouteData(
          desintation: dist, src: currentposition!);
      polyLines = routesUtils.displayRoute(routeInfo.points,
          polyLines: polyLines, googleMapController: googleMapController!);
      emit(CaptinMapChange(
          polyLine: polyLines,
          markers: markers,
          distance: routeInfo.distance,
          isStarted: isStarted));
    } catch (e) {
      log("Error fetching location: $e");
    }
  }

  Future<void> setUserLocation(LatLng locationData) async {
    emit(CaptinMapInitial());

    markers.removeWhere(
        (marker) => marker.markerId.value == 'user_location_marker');

    markers.add(
      Marker(
        markerId: const MarkerId('user_location_marker'),
        position: locationData,
        // infoWindow: const InfoWindow(title: 'user Location'),
        icon: await getIcon(assetName: Assets.imagesUserMarker2),
      ),
    );
  }

  void setdistLocation(LatLng locationData) async {
    emit(CaptinMapInitial());

    markers.removeWhere((marker) => marker.markerId.value == 'dist_location');

    markers.add(
      Marker(
        markerId: const MarkerId('dist_location'),
        position: locationData,
      ),
    );
  }

  void setMyCameraPosition(LatLng locationData) {
    var camerPosition = CameraPosition(target: locationData, zoom: 19);
    googleMapController
        ?.animateCamera(CameraUpdate.newCameraPosition(camerPosition));
  }

  void setMapController(GoogleMapController controller) {
    googleMapController = controller;
  }
}
