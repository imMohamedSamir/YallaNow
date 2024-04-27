import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yallanow/Core/utlis/location_service.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/functions/RoutesUtlis.dart';

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

  void getMyCurrentPosition() async {
    await locationService.checkAndRequestLocationService();
    var hasPermission =
        await locationService.checkAndRequestLocationPermission();
    if (hasPermission) {
      currentposition = await locationService.getCurrentLocationData();
      locationDetails = await defineLocationDetails(location: currentposition!);

      getLocationDetails();
    }
  }

  void updateMyLocation() async {
    await locationService.checkAndRequestLocationService();
    var hasPermission =
        await locationService.checkAndRequestLocationPermission();
    if (hasPermission) {
      currentposition = await locationService.getCurrentLocationData();
      locationDetails = await defineLocationDetails(location: currentposition!);

      setMyLocationMark(currentposition!);

      setMyCameraPosition(currentposition!);
    }
  }

  Future<void> selectedLocation({required String description}) async {
    try {
      List<Location> locations = await locationFromAddress(description);

      if (locations.isNotEmpty) {
        Location location = locations.first;
        LatLng desintation = LatLng(location.latitude, location.longitude);
        locationDetails = await defineLocationDetails(location: desintation);

        setSearchedLocationMark(desintation);
        // setMyCameraPosition(desintation);

        List<LatLng> points = await routesUtils.getRouteData(
            desintation: desintation, src: currentposition!);
        routesUtils.displayRoute(points,
            polyLines: polyLines, googleMapController: googleMapController!);
        emit(ScooterLocationGetRoutes(polyLines: polyLines));
      }
    } catch (e) {
      throw Exception("Error fetching location: $e");
    }
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
  void handleCameraMove({required CameraPosition position}) async {
    LatLng newLocation = position.target;
    locationDetails = await defineLocationDetails(location: newLocation);
    log(locationDetails!.toJson().toString());
  }

  ///////////////////////////////////////////////////////////
  void setMyCameraPosition(LatLng locationData) {
    var camerPosition = CameraPosition(target: locationData, zoom: 15);
    googleMapController
        ?.animateCamera(CameraUpdate.newCameraPosition(camerPosition));
    emit(ScooterLocationSuccess(locationData: locationData, markers: markers));
  }

  void setMyLocationMark(LatLng locationData) {
    markers.removeWhere((marker) =>
        marker.markerId.value == 'searched_location_marker' ||
        marker.markerId.value == 'my_location_marker');
    markers.add(
      Marker(
        markerId: const MarkerId('my_location_marker'),
        position: locationData,
      ),
    );
    emit(ScooterLocationSuccess(locationData: locationData, markers: markers));
  }

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
    emit(ScooterLocationSuccess(
      locationData: locationData,
      markers: markers,
    ));
  }

  ////////////////////////////////////////////////////////////////

  void setMapController(GoogleMapController controller) {
    googleMapController = controller;
  }

  // TextEditingController setTextEditingController() {}
}
