part of 'place_trips_cubit.dart';

sealed class PlaceTripsState extends Equatable {
  const PlaceTripsState();

  @override
  List<Object> get props => [];
}

enum AnimationDirection { forward, backward }

final class PlaceTripsInitial extends PlaceTripsState {}

final class PlaceTripsLoading extends PlaceTripsState {}

final class PlaceTripsSuccess extends PlaceTripsState {
  final List<TripCardModel> trips;

  final bool hasMore;
  final int currentPage;

  final AnimationDirection direction;

  const PlaceTripsSuccess({
    required this.trips,
    required this.currentPage,
    required this.hasMore,
    required this.direction,
  });
}

final class PlaceTripsFailure extends PlaceTripsState {
  final String errMsg;

  const PlaceTripsFailure({required this.errMsg});
}
