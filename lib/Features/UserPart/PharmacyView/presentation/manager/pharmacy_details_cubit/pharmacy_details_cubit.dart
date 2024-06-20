import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/utlis/functions/SavePartnerId.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/Repo/PharmacyRepo.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/models/pharmacy_details_model/pharmacy_details_model.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/models/pharmacy_model.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyPage.dart';

part 'pharmacy_details_state.dart';

class PharmacyDetailsCubit extends Cubit<PharmacyDetailsState> {
  PharmacyDetailsCubit(this.pharmacyRepo) : super(PharmacyDetailsInitial());
  final PharmacyRepo pharmacyRepo;
  void getPharmacyDetails(BuildContext context,
      {required PharmacyModel pharmacyModel}) async {
    emit(PharmacyDetailsLoading());
    var resutls = await pharmacyRepo.fetchPharmaciesDetails(
        pharmacyId: pharmacyModel.id!);
    resutls
        .fold((fail) => emit(PharmacyDetailsFailure(errMsg: fail.errMessage)),
            (pharmacyDetails) {
      savePartnerId(id: pharmacyModel.id!, type: pharmacyType);

      emit(PharmacyDetailsSuccess(pharmacyDetails: pharmacyDetails));
      NavigateToPage.slideFromRight(
          context: context, page: PharmacyPage(pharmacy: pharmacyModel));
    });
  }
}
