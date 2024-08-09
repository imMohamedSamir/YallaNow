part of 'marts_search_cubit.dart';

sealed class MartsSearchState extends Equatable {
  const MartsSearchState();

  @override
  List<Object> get props => [];
}

final class MartsSearchInitial extends MartsSearchState {}

final class MartsSearchLoading extends MartsSearchState {}

final class MartsSearchSuccess extends MartsSearchState {
  final List<SearchResultModel> results;

  const MartsSearchSuccess({required this.results});
}

final class MartsSearchFailure extends MartsSearchState {
  final String errMsg;

  const MartsSearchFailure({required this.errMsg});
}
