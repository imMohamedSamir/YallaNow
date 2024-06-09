import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yallanow/Core/utlis/location_service.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/data/models/RouteInfoModel.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/functions/RoutesUtlis.dart';

part 'delivery_map_state.dart';

class DeliveryMapCubit extends Cubit<DeliveryMapState> {
  DeliveryMapCubit(this.locationService, this.routesUtils)
      : super(DeliveryMapInitial());
  final LocationService locationService;
  final RoutesUtils routesUtils;
  GoogleMapController? googleMapController;
  Set<Marker> markers = {};
  Placemark? locationDetails;
  LatLng? currentposition, newposition;
  bool isMoved = false;
  Set<Polyline> polyLines = {};

  void updateMyLocation() async {
    await locationService.checkAndRequestLocationService();
    var hasPermission =
        await locationService.checkAndRequestLocationPermission();
    if (hasPermission) {
      currentposition = await locationService.getCurrentLocationData();
      // locationDetails = await defineLocationDetails(location: currentposition!);

      // setMyLocation(currentposition!);
      setMyCameraPosition(currentposition!);
      emit(
          DeliveryMapSuccess(locationData: currentposition!, markers: markers));
      isMoved = true;
    }
  }

  Future<void> getRoutes({required LatLng dist}) async {
    emit(DeliveryMapInitial());
    try {
      RouteInfo routeInfo = await routesUtils.getRouteData(
          desintation: dist, src: currentposition!);
      polyLines = routesUtils.displayRoute(routeInfo.points,
          polyLines: polyLines, googleMapController: googleMapController!);
      setDistenatioLocation(dist);
      emit(DeliveryMapChange(polyLine: polyLines, markers: markers));
      updateMyTrackingLocation();
    } catch (e) {
      log("Error fetching location: $e");
    }
  }

  void updateMyTrackingLocation() async {
    await locationService.checkAndRequestLocationService();
    var hasPermission =
        await locationService.checkAndRequestLocationPermission();
    if (hasPermission) {
      locationService.getRealTimeLocationData((locationData) {
        LatLng postion =
            LatLng(locationData.latitude!, locationData.longitude!);
        setMyCameraPosition(postion);
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
