import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/top_categ_resturant.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Repo/FoodRepo.dart';

part 'top_categ_resturant_state.dart';

class TopCategResturantCubit extends Cubit<TopCategResturantState> {
  TopCategResturantCubit(this.foodRepo) : super(TopCategResturantInitial());
  final FoodRepo foodRepo;
  void fetchResturants({required String categoryId}) async {
    emit(TopCategResturantLoading());
    var result =
        await foodRepo.fetchPopularCategoryPage(categoryId: categoryId);
    result.fold(
        (fail) => emit(TopCategResturantFailure(errmsg: fail.errMessage)),
        (resturants) => emit(TopCategResturantSuccess(resturants: resturants)));
  }
}
