part of 'popular_food_category_cubit.dart';

sealed class PopularFoodCategoryState extends Equatable {
  const PopularFoodCategoryState();

  @override
  List<Object> get props => [];
}

final class PopularFoodCategoryInitial extends PopularFoodCategoryState {}

final class PopularFoodCategorySuccess extends PopularFoodCategoryState {
  final List<PopularFoodCategory> categories;

  PopularFoodCategorySuccess({required this.categories});
}

final class PopularFoodCategoryLoading extends PopularFoodCategoryState {}

final class PopularFoodCategoryFailure extends PopularFoodCategoryState {
  final String errMsg;

  PopularFoodCategoryFailure({required this.errMsg});
}
