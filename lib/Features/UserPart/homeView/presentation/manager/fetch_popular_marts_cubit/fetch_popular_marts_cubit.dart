import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/home_marts_model.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Repo/HomeRepo.dart';

part 'fetch_popular_marts_state.dart';

class FetchPopularMartsCubit extends Cubit<FetchPopularMartsState> {
  FetchPopularMartsCubit(this.homeRepo) : super(FetchPopularMartsInitial());
  final HomeRepo homeRepo;
  void get() async {
    emit(FetchPopularMartsLoading());
    var result = await homeRepo.fetchPopularMarts();
    result.fold(
        (faile) => emit(FetchPopularMartsFailure(errMsg: faile.errMessage)),
        (marts) => emit(FetchPopularMartsSuccess(marts: marts)));
  }
}
