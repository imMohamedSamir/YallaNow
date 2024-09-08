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
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/manager/captin_map_cubit/CalculateDistance.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/data/models/RouteInfoModel.dart';
import 'package:yallanow/Core/utlis/RoutesUtlis.dart';

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
  // bool isMoved = false;
  Set<Polyline> polyLines = {};
  bool isStarted = false;
  bool isFinished = false;
  LatLng? _dist;
  LatLng? _userLocation;
  double? _userdistance;
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

  @override
  Future<void> close() async {
    // Cancel any active subscriptions when the cubit is closed
    return super.close();
  }

  void updateMyLocation(BuildContext context) async {
    await locationService.checkAndRequestLocationService();
    var hasPermission =
        await locationService.checkAndRequestLocationPermission();
    if (hasPermission) {
      currentposition = await locationService.getCurrentLocationData();
      setMyCameraPosition(currentposition!);
      if (context.mounted) {
        locationsMethod(context);
      }
      emit(CaptinMapSuccess(locationData: currentposition!, markers: markers));

      // isMoved = true;
    }
  }

  void listenToDriverLocationUpdates(BuildContext context) async {
    String driverId =
        BlocProvider.of<CaptinRideRequestCubit>(context).detailsModel.driverId;
    final DatabaseReference driversRef =
        FirebaseDatabase.instance.ref('drivers/$driverId');
    _driversSubscription = driversRef.onValue.listen((event) {
      emit(CaptinMapLoading(polyLine: polyLines));
      if (event.snapshot.value != null) {
        final data = event.snapshot.value as Map<dynamic, dynamic>;
        final newLatitude = data['CurrentLatitude'] as double;
        final newLongitude = data['CurrentLongitude'] as double;

        newposition = LatLng(newLatitude, newLongitude);
        log("new position: $newposition");
        // Update the driver's marker position on the map
        // updateDriverMarker(newposition!);

        currentposition = newposition;
        locationsMethod(context);
        emit(CaptinMapChange(
            polyLine: polyLines,
            markers: markers,
            distance: _userdistance,
            isStarted: isStarted));
        // setMyCameraPosition(currentposition!);
      }
    });
  }

  void cancelListening() async {
    await _driversSubscription?.cancel();
  }

  Future<void> updateDriverMarker(LatLng newLocation) async {
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

  void getRoutes(BuildContext context) async {
    emit(CaptinMapInitial());

    try {
      RouteInfo routeInfo = await routesUtils.getRouteData(
          desintation: _userLocation!, src: currentposition!);
      polyLines = routesUtils.displayRoute(routeInfo.points,
          polyLines: polyLines, googleMapController: googleMapController!);
      polyLines = await routesUtils.displayAnotherRoute(
          destination: _dist!,
          newPoint: _userLocation!,
          googleMapController: googleMapController!,
          polyLines: polyLines);
      emit(CaptinMapChange(
          polyLine: polyLines, markers: markers, isStarted: isStarted));
    } catch (e) {
      log("Error fetching location: $e");
    }
  }

  void locationsMethod(BuildContext context) async {
    var requestCubit =
        BlocProvider.of<CaptinRideRequestCubit>(context).detailsModel;
    double lat = requestCubit.currentLatitude;
    double lng = requestCubit.currentLongitude;
    _userLocation = LatLng(lat, lng);
    await setUserLocation(_userLocation!);
    /////////////////////////////////////////////////
    double distlat = requestCubit.dstLatitude;
    double dsitlng = requestCubit.dstLongitude;
    _dist = LatLng(distlat, dsitlng);
    setdistLocation(_dist!);
    await updateDriverMarker(currentposition!);

    _userdistance = calculateDistance(
            dist: _userLocation!, src: newposition ?? const LatLng(50, 50)) *
        1000;
    log("${(_userdistance!).toStringAsFixed(2)} meter");
  }

  Future<void> setUserLocation(LatLng locationData) async {
    // markers.removeWhere(
    //     (marker) => marker.markerId.value == 'user_location_marker');

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
