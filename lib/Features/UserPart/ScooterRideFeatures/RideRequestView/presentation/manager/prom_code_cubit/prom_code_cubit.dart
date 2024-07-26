import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/TokenManger.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/Repos/ScooterRequestRepo.dart';

part 'prom_code_state.dart';

class PromCodeCubit extends Cubit<PromCodeState> {
  PromCodeCubit(this._requestRepo) : super(PromCodeInitial());
  final ScooterRequestRepo _requestRepo;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController codeController = TextEditingController();
  void apply() async {
    emit(PromCodeLoading());
    String userId = await TokenManager.getUserId();
    if (key.currentState!.validate()) {
      key.currentState!.save();
      log(userId);

      log(codeController.text);
      var result = await _requestRepo.applyPromoCode(
          userId: userId, promoCode: codeController.text);
      result.fold((fail) => emit(PromCodeFailure(errMsg: fail.errMessage)),
          (response) => emit(PromCodeApplied()));
    }
  }

  void cancell({required String promoCode}) async {
    emit(PromCodeLoading());
    String userId = await TokenManager.getUserId();

    var result = await _requestRepo.cancelPromoCode(
        userId: userId, promoCode: promoCode);
    result.fold((fail) => emit(PromCodeFailure(errMsg: fail.errMessage)),
        (response) => emit(PromCodeCancelled()));
  }
}
