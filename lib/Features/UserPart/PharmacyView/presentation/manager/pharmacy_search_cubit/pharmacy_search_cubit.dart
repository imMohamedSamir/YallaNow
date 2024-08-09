import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/Repo/PharmacyRepo.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/search_result_model.dart';

part 'pharmacy_search_state.dart';

class PharmacySearchCubit extends Cubit<PharmacySearchState> {
  PharmacySearchCubit(this._pharmacyRepo) : super(PharmacySearchInitial());
  final PharmacyRepo _pharmacyRepo;

  void getResult({required String input}) async {
    emit(PharmacySearchLoading());
    var result = await _pharmacyRepo.pharmacySearch(input: input);
    result.fold((fail) => emit(PharmacySearchFailure(errMsg: fail.errMessage)),
        (results) => emit(PharmacySearchSuccess(results: results)));
  }
}
