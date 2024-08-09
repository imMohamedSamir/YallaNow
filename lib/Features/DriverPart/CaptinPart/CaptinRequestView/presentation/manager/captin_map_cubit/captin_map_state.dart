part of 'captin_map_cubit.dart';

sealed class CaptinMapState extends Equatable {
  const CaptinMapState();

  @override
  List<Object> get props => [];
}

final class CaptinMapInitial extends CaptinMapState {}

final class CaptinMapSuccess extends CaptinMapState {
  final LatLng locationData;
  final Set<Marker> markers;

  const CaptinMapSuccess({required this.locationData, required this.markers});
}

final class CaptinMapFaile extends CaptinMapState {}

final class CaptinMapLoading extends CaptinMapState {
  final Set<Polyline>? polyLine;

  const CaptinMapLoading({this.polyLine});
}

final class CaptinMapChange extends CaptinMapState {
  final LatLng? currentLtLng;
  final Set<Marker>? markers;
  final Set<Polyline>? polyLine;
  final double? distance;
  final bool? isStarted;

  const CaptinMapChange({
    this.currentLtLng,
    this.markers,
    this.polyLine,
    this.distance,
    this.isStarted = false,
  });
}
