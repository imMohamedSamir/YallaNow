import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yallanow/Core/utlis/location_service.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/manager/ride_request_cubit/CaptinRequestCubit.dart';
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
  LatLng? test;

  void updateMyLocation(BuildContext context) async {
    var requestCubit = BlocProvider.of<CaptinRequestCubit>(context);

    await locationService.checkAndRequestLocationService();
    var hasPermission =
        await locationService.checkAndRequestLocationPermission();
    if (hasPermission) {
      currentposition = await locationService.getCurrentLocationData();
      // locationDetails = await defineLocationDetails(location: currentposition!);

      //26.959558277409748, 31.35835702883909 setMyLocation(currentposition!);
      test = LatLng(26.959558277409748, 31.35835702883909);
      setMyCameraPosition(test!);
      emit(CaptinMapSuccess(locationData: currentposition!, markers: markers));
      requestCubit.driverInfo.latitude = currentposition!.latitude;
      requestCubit.driverInfo.longitude = currentposition!.longitude;
      isMoved = true;
    }
  }

  Future<void> getRoutes(BuildContext context) async {
    emit(CaptinMapInitial());
    var requestCubit =
        BlocProvider.of<CaptinRequestCubit>(context).requestDetails;
    double lat = double.parse(requestCubit.srcLat!);
    double lng = double.parse(requestCubit.srcLng!);
    LatLng dist = LatLng(lat, lng);
    try {
      RouteInfo routeInfo =
          await routesUtils.getRouteData(desintation: dist, src: test!);
      polyLines = routesUtils.displayRoute(routeInfo.points,
          polyLines: polyLines, googleMapController: googleMapController!);
      setDistenatioLocation(dist);
      emit(CaptinMapChange(polyLine: polyLines, markers: markers));
      // updateMyTrackingLocation();
    } catch (e) {
      log("Error fetching location: $e");
    }
  }

  void updateMyTrackingLocation(BuildContext context) async {
    var requestCubit = BlocProvider.of<CaptinRequestCubit>(context);

    await locationService.checkAndRequestLocationService();
    var hasPermission =
        await locationService.checkAndRequestLocationPermission();
    if (hasPermission) {
      locationService.getRealTimeLocationData((locationData) async {
        LatLng postion =
            LatLng(locationData.latitude!, locationData.longitude!);
        requestCubit.driverInfo.latitude = postion.latitude;
        requestCubit.driverInfo.longitude = postion.longitude;
        requestCubit.driverInfo.vehicleType = "Scooter Vehicle 1";
        // await requestCubit.updateDriverLocation();

        // setMyCameraPosition(postion);
      });
    }
  }

  // Future<Placemark> defineLocationDetails({required LatLng location}) async {
  //   try {
  //     List<Placemark> placemarks =
  //         await placemarkFromCoordinates(location.latitude, location.longitude);

  //     if (placemarks.isNotEmpty) {
  //       Placemark locationDetails = placemarks.first;
  //       return locationDetails;
  //     } else {
  //       return const Placemark(
  //         name: '',
  //         locality: '',
  //         subLocality: '',
  //         administrativeArea: '',
  //         postalCode: '',
  //         country: '',
  //       );
  //     }
  //   } catch (e) {
  //     return const Placemark(
  //       name: '',
  //       locality: '',
  //       subLocality: '',
  //       administrativeArea: '',
  //       postalCode: '',
  //       country: '',
  //     );
  //   }
  // }

  void setDistenatioLocation(LatLng locationData) {
    markers.removeWhere((marker) =>
        marker.markerId.value == 'searched_location_marker' ||
        marker.markerId.value == 'my_location_marker');

    markers.add(
      Marker(
          markerId: const MarkerId('searched_location_marker'),
          position: locationData),
    );
  }

  void setMyCameraPosition(LatLng locationData) {
    var camerPosition = CameraPosition(target: locationData, zoom: 15);
    googleMapController
        ?.animateCamera(CameraUpdate.newCameraPosition(camerPosition));
  }

  void setMapController(GoogleMapController controller) {
    googleMapController = controller;
  }
}
