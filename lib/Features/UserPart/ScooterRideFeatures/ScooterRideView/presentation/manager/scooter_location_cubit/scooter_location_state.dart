part of 'scooter_location_cubit.dart';

sealed class ScooterLocationState extends Equatable {
  const ScooterLocationState();

  @override
  List<Object> get props => [];
}

final class ScooterLocationInitial extends ScooterLocationState {}

final class ScooterLocationLoading extends ScooterLocationState {}

final class ScooterLocationSuccess extends ScooterLocationState {
  final LatLng locationData;
  final Set<Marker> markers;

  ScooterLocationSuccess({required this.locationData, required this.markers});
}

final class ScooterLocationGetLocation extends ScooterLocationState {
  final Placemark locationData;

  ScooterLocationGetLocation({required this.locationData});
}

final class ScooterLocationGetRoutes extends ScooterLocationState {
  final Set<Polyline> polyLines;

  ScooterLocationGetRoutes({required this.polyLines});
}
