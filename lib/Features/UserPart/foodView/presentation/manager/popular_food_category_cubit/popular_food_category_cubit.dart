import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/popular_food_category.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Repo/FoodRepo.dart';

part 'popular_food_category_state.dart';

class PopularFoodCategoryCubit extends Cubit<PopularFoodCategoryState> {
  PopularFoodCategoryCubit(this.foodRepo) : super(PopularFoodCategoryInitial());
  final FoodRepo foodRepo;
  void getPopularFoodCategory() async {
    emit(PopularFoodCategoryLoading());
    var results = await foodRepo.fetchPopularCategory();
    results.fold(
        (failure) =>
            emit(PopularFoodCategoryFailure(errMsg: failure.errMessage)),
        (categories) =>
            emit(PopularFoodCategorySuccess(categories: categories)));
  }
}
