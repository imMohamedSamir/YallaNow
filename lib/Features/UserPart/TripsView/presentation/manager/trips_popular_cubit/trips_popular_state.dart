part of 'trips_popular_cubit.dart';

sealed class TripsPopularState extends Equatable {
  const TripsPopularState();

  @override
  List<Object> get props => [];
}

final class TripsPopularInitial extends TripsPopularState {}

final class TripsPopularLoading extends TripsPopularState {}

final class TripsPopularSuccess extends TripsPopularState {
  final List<PopularTripModel> trips;

  const TripsPopularSuccess({required this.trips});
}

final class TripsPopularFailure extends TripsPopularState {
  final String errMsg;

  const TripsPopularFailure({required this.errMsg});
}
