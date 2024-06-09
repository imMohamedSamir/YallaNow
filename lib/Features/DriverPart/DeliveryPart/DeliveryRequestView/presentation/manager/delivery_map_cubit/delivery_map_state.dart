part of 'delivery_map_cubit.dart';

sealed class DeliveryMapState extends Equatable {
  const DeliveryMapState();

  @override
  List<Object> get props => [];
}

final class DeliveryMapInitial extends DeliveryMapState {}

final class DeliveryMapSuccess extends DeliveryMapState {
  final LatLng locationData;
  final Set<Marker> markers;

  DeliveryMapSuccess({required this.locationData, required this.markers});
}

final class DeliveryMapFailure extends DeliveryMapState {}

final class DeliveryMapChange extends DeliveryMapState {
  final LatLng? currentLtLng;
  final Set<Marker>? markers;
  final Set<Polyline>? polyLine;

  const DeliveryMapChange({this.currentLtLng, this.markers, this.polyLine});
}
