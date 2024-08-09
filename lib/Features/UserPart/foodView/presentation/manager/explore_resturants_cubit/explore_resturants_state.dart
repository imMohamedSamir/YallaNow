part of 'explore_resturants_cubit.dart';

sealed class ExploreResturantsState extends Equatable {
  const ExploreResturantsState();

  @override
  List<Object> get props => [];
}

final class ExploreResturantsInitial extends ExploreResturantsState {}

final class ExploreResturantsLoading extends ExploreResturantsState {}

final class ExploreResturantsSuccess extends ExploreResturantsState {
  final List<TopCategResturant> resturants;

  const ExploreResturantsSuccess({required this.resturants});
}

final class ExploreResturantsFailure extends ExploreResturantsState {
  final String errMsg;

  const ExploreResturantsFailure({required this.errMsg});
}
