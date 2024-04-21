import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/popular_resturants.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Repo/HomeRepo.dart';

part 'fetch_popular_resturants_state.dart';

class FetchPopularResturantsCubit extends Cubit<FetchPopularResturantsState> {
  FetchPopularResturantsCubit(this.homeRepo)
      : super(FetchPopularResturantsInitial());
  final HomeRepo homeRepo;
  getResturants() async {
    emit(FetchPopularResturantsLoading());
    var data = await homeRepo.fetchPopularResturant();
    data.fold(
        (fail) => emit(FetchPopularResturantsFailure(errMSG: fail.errMessage)),
        (resturants) =>
            emit(FetchPopularResturantsSuccess(resturants: resturants)));
  }
}
