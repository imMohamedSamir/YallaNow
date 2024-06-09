part of 'home_search_cubit.dart';

sealed class HomeSearchState extends Equatable {
  const HomeSearchState();

  @override
  List<Object> get props => [];
}

final class HomeSearchInitial extends HomeSearchState {}

final class HomeSearchLoading extends HomeSearchState {}

final class HomeSearchSuccess extends HomeSearchState {
  final List<SearchResultModel> results;

  const HomeSearchSuccess({required this.results});
}

final class HomeSearchFailure extends HomeSearchState {
  final String errmsg;

  const HomeSearchFailure({required this.errmsg});
}
