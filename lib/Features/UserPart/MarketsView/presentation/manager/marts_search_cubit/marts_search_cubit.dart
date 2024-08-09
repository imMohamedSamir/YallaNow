import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/Repo/MartsRepo.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/search_result_model.dart';

part 'marts_search_state.dart';

class MartsSearchCubit extends Cubit<MartsSearchState> {
  MartsSearchCubit(this._martsRepo) : super(MartsSearchInitial());
  final MartsRepo _martsRepo;
  void search({required String input}) async {
    emit(MartsSearchLoading());
    var result = await _martsRepo.martsSearch(input: input);
    result.fold((fail) => emit(MartsSearchFailure(errMsg: fail.errMessage)),
        (results) => emit(MartsSearchSuccess(results: results)));
  }
}
