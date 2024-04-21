import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yallanow/Core/utlis/location_service.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/functions/RoutesUtlis.dart';

part 'current_location_cubit_state.dart';

class CurrentLocationCubit extends Cubit<CurrentLocationCubitState> {
  CurrentLocationCubit(this.locationService, this.routesUtils)
      : super(CurrentLocationCubitInitial());
  final LocationService locationService;
  final RoutesUtils routesUtils;
  GoogleMapController? googleMapController;
  Set<Marker> markers = {};
  Placemark? locationDetails;
  Set<Polyline> polyLine = {};
  LatLng? currentposition;

  void updateMyLocation() async {
    await locationService.checkAndRequestLocationService();
    var hasPermission =
        await locationService.checkAndRequestLocationPermission();
    if (hasPermission) {
      currentposition = await locationService.getCurrentLocationData();
      locationDetails = await defineLocationDetails(location: currentposition!);

      setMyLocation(currentposition!);

      setMyCameraPosition(currentposition!);
    }
  }

  Future<void> SelectedLocation({required String description}) async {
    try {
      List<Location> locations = await locationFromAddress(description);

      if (locations.isNotEmpty) {
        Location location = locations.first;
        LatLng desintation = LatLng(location.latitude, location.longitude);
        locationDetails = await defineLocationDetails(location: desintation);
        setSearchedLocation(desintation);
        setMyCameraPosition(desintation);
        // List<LatLng> points = await RoutesUtils()
        //     .getRouteData(desintation: desintation, src: currentposition!);
        // print(points.length);
        // RoutesUtils().displayRoute(points,
        //     polyLines: polyLine, googleMapController: googleMapController!);
        // emit(CurrentLocationCubitGetRoute(
        //     polyLines: polyLine, markers: markers));
        // setMyCameraPosition(currentposition);
      }
    } catch (e) {
      throw Exception("Error fetching location: $e");
    }
  }

  void getLocationDetails() {
    emit(CurrentLocationCubitgetDetails(locationData: locationDetails!));
  }

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
      throw Exception("Error fetching location details: $e");
    }
  }

  void handleCameraMove({required CameraPosition position}) async {
    LatLng newLocation = position.target;
    locationDetails = await defineLocationDetails(location: newLocation);
    // getLocationDetails(); // Emit state to update location details
  }

  void setMyLocation(LatLng locationData) {
    markers.removeWhere((marker) =>
        marker.markerId.value == 'searched_location_marker' ||
        marker.markerId.value == 'my_location_marker');
    markers.add(
      Marker(
        markerId: const MarkerId('my_location_marker'),
        position: locationData,
      ),
    );
    emit(CurrentLocationCubitSucsess(
        locationData: locationData, markers: markers));
  }

  void setSearchedLocation(LatLng locationData) {
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
    emit(CurrentLocationCubitSucsess(
      locationData: locationData,
      markers: markers,
    ));
  }

  void setMyCameraPosition(LatLng locationData) {
    var camerPosition = CameraPosition(target: locationData, zoom: 15);
    googleMapController
        ?.animateCamera(CameraUpdate.newCameraPosition(camerPosition));
    emit(CurrentLocationCubitSucsess(
        locationData: locationData, markers: markers));
  }

  void setMapController(GoogleMapController controller) {
    googleMapController = controller;
  }
}
