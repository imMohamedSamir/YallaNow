import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/Repo/PharmacyRepo.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/models/pharmacy_model.dart';

part 'pharmacies_home_state.dart';

class PharmaciesHomeCubit extends Cubit<PharmaciesHomeState> {
  PharmaciesHomeCubit(this.pharmacyRepo) : super(PharmaciesHomeInitial());
  final PharmacyRepo pharmacyRepo;
  void getPharmacies() async {
    emit(PharmaciesHomeLoading());
    var results = await pharmacyRepo.fetchPharmacies();
    results.fold(
        (faile) => emit(PharmaciesHomeFailure(errMsg: faile.errMessage)),
        (pharmacies) => emit(PharmaciesHomeSuccess(pharmacies: pharmacies)));
  }
}
