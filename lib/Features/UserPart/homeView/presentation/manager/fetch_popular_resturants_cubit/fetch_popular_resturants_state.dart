part of 'fetch_popular_resturants_cubit.dart';

sealed class FetchPopularResturantsState extends Equatable {
  const FetchPopularResturantsState();

  @override
  List<Object> get props => [];
}

final class FetchPopularResturantsInitial extends FetchPopularResturantsState {}

final class FetchPopularResturantsLoading extends FetchPopularResturantsState {}

final class FetchPopularResturantsFailure extends FetchPopularResturantsState {
  final String errMSG;

  FetchPopularResturantsFailure({required this.errMSG});
}

final class FetchPopularResturantsSuccess extends FetchPopularResturantsState {
  final List<PopularResturants> resturants;

  FetchPopularResturantsSuccess({required this.resturants});
}
