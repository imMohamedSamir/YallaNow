part of 'fetch_popular_marts_cubit.dart';

sealed class FetchPopularMartsState extends Equatable {
  const FetchPopularMartsState();

  @override
  List<Object> get props => [];
}

final class FetchPopularMartsInitial extends FetchPopularMartsState {}

final class FetchPopularMartsLoading extends FetchPopularMartsState {}

final class FetchPopularMartsSuccess extends FetchPopularMartsState {
  final List<HomeMartsModel> marts;

  const FetchPopularMartsSuccess({required this.marts});
}

final class FetchPopularMartsFailure extends FetchPopularMartsState {
  final String errMsg;

  const FetchPopularMartsFailure({required this.errMsg});
}
