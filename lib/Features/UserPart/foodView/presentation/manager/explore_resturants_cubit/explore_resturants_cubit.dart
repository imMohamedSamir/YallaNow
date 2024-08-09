import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/top_categ_resturant.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Repo/FoodRepo.dart';

part 'explore_resturants_state.dart';

class ExploreResturantsCubit extends Cubit<ExploreResturantsState> {
  ExploreResturantsCubit(this._foodRepo) : super(ExploreResturantsInitial());
  final FoodRepo _foodRepo;
  void get() async {
    emit(ExploreResturantsLoading());
    var result = await _foodRepo.fetchExploreResturant();
    result.fold(
        (fail) => emit(ExploreResturantsFailure(errMsg: fail.errMessage)),
        (resturants) => emit(ExploreResturantsSuccess(resturants: resturants)));
  }
}
