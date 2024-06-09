import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Repo/FoodRepo.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/search_result_model.dart';

part 'food_search_state.dart';

class FoodSearchCubit extends Cubit<FoodSearchState> {
  FoodSearchCubit(this.foodRepo) : super(FoodSearchInitial());
  final FoodRepo foodRepo;
  void getResults({required String input}) async {
    emit(FoodSearchLoading());
    var result = await foodRepo.fetchSearch(input: input);
    result.fold((faile) => emit(FoodSearchFailure(errmsg: faile.errMessage)),
        (results) => emit(FoodSearchSuccess(results: results)));
  }
}
