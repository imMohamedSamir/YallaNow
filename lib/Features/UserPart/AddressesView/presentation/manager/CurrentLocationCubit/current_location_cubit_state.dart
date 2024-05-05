part of 'current_location_cubit_cubit.dart';

sealed class CurrentLocationCubitState {}

final class CurrentLocationCubitInitial extends CurrentLocationCubitState {}

final class CurrentLocationCubitSucsess extends CurrentLocationCubitState {
  final LatLng locationData;
  final Set<Marker> markers;

  CurrentLocationCubitSucsess(
      {required this.locationData, required this.markers});
}

final class CurrentLocationCubitgetDetails extends CurrentLocationCubitState {
  final Placemark locationData;
  final LatLng currentPosition;
  CurrentLocationCubitgetDetails(
      {required this.locationData, required this.currentPosition});
}

final class CurrentLocationCubitGetRoute extends CurrentLocationCubitState {
  final Set<Polyline> polyLines;

  CurrentLocationCubitGetRoute({required this.polyLines});
}
