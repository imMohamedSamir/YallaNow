part of 'scooter_location_cubit.dart';

sealed class ScooterLocationState extends Equatable {
  const ScooterLocationState();

  @override
  List<Object> get props => [];
}

final class ScooterLocationInitial extends ScooterLocationState {}

final class ScooterLocationLoading extends ScooterLocationState {}

final class ScooterLocationFailuer extends ScooterLocationState {
  final String errmsg;

  const ScooterLocationFailuer({required this.errmsg});
}

final class ScooterLocationSuccess extends ScooterLocationState {
  final LatLng locationData;
  final Set<Marker> markers;

  const ScooterLocationSuccess(
      {required this.locationData, required this.markers});
}

final class ScooterLocationChange extends ScooterLocationState {
  final Set<Polyline>? polyLines;
  final Set<Marker>? markers;
  final bool? isUpdateed;
  const ScooterLocationChange(
      {this.markers, this.polyLines, this.isUpdateed = false});
}

final class ScooterLocationGetLocation extends ScooterLocationState {
  final Placemark locationData;

  const ScooterLocationGetLocation({required this.locationData});
}

final class ScooterLocationGetRoutes extends ScooterLocationState {
  final Set<Polyline> polyLines;

  const ScooterLocationGetRoutes({required this.polyLines});
}
