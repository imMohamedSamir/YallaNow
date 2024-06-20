import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/Repo/PharmacyRepo.dart';

part 'pharmacy_search_state.dart';

class PharmacySearchCubit extends Cubit<PharmacySearchState> {
  PharmacySearchCubit(this.pharmacyRepo) : super(PharmacySearchInitial());
  final PharmacyRepo pharmacyRepo;

  void getResult({required String input}) async {}
}
