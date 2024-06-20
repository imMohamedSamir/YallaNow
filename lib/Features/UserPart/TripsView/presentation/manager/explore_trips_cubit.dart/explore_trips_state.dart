part of 'explore_trips_cubit.dart';

sealed class ExploreTripsState extends Equatable {
  const ExploreTripsState();

  @override
  List<Object> get props => [];
}

final class ExploreTripsInitial extends ExploreTripsState {}

final class ExploreTripsLoading extends ExploreTripsState {}

final class ExploreTripsSuccess extends ExploreTripsState {
  final List<TripCardModel> trips;
  final bool hasMore;
  final bool isFirstPage;

  const ExploreTripsSuccess({
    required this.trips,
    required this.hasMore,
    required this.isFirstPage,
  });
}

final class ExploreTripsFailure extends ExploreTripsState {
  final String errMsg;

  const ExploreTripsFailure({required this.errMsg});
}
