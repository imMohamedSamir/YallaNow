part of 'food_search_cubit.dart';

sealed class FoodSearchState extends Equatable {
  const FoodSearchState();

  @override
  List<Object> get props => [];
}

final class FoodSearchInitial extends FoodSearchState {}

final class FoodSearchLoading extends FoodSearchState {}

final class FoodSearchSuccess extends FoodSearchState {
  final List<SearchResultModel> results;

  const FoodSearchSuccess({required this.results});
}

final class FoodSearchFailure extends FoodSearchState {
  final String errmsg;

  const FoodSearchFailure({required this.errmsg});
}
