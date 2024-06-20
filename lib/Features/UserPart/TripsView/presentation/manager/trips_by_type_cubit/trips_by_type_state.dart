part of 'trips_by_type_cubit.dart';

sealed class TripsByTypeState extends Equatable {
  const TripsByTypeState();

  @override
  List<Object> get props => [];
}

final class TripsByTypeInitial extends TripsByTypeState {}

final class TripsByTypeLoading extends TripsByTypeState {}

final class TripsByTypeSuccess extends TripsByTypeState {
  final List<TripCardModel> trips;
  final bool hasMore;
  final int currentPage;

  final AnimationDirection direction;

  const TripsByTypeSuccess({
    required this.trips,
    required this.hasMore,
    required this.currentPage,
    required this.direction,
  });
}

final class TripsByTypeFailure extends TripsByTypeState {
  final String errMsg;

  const TripsByTypeFailure({required this.errMsg});
}
