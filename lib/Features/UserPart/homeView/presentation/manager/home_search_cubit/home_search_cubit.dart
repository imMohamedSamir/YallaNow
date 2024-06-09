import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/search_result_model.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Repo/HomeRepo.dart';

part 'home_search_state.dart';

class HomeSearchCubit extends Cubit<HomeSearchState> {
  HomeSearchCubit(this.homeRepo) : super(HomeSearchInitial());
  final HomeRepo homeRepo;
  void getResult({required String input}) async {
    emit(HomeSearchLoading());
    var result = await homeRepo.fetchSearchResults(input: input);
    result.fold((faile) => emit(HomeSearchFailure(errmsg: faile.errMessage)),
        (results) => emit(HomeSearchSuccess(results: results)));
  }
}
