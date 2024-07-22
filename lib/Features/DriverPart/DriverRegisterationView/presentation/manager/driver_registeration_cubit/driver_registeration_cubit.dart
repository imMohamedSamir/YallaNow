import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/data/Repo/DriverRegisterationRepo.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/data/models/DrRegisterModel.dart';

part 'driver_registeration_state.dart';

class DriverRegisterationCubit extends Cubit<DriverRegisterationState> {
  DriverRegisterationCubit(this.driverRegisterationRepo)
      : super(DriverRegisterationInitial());
  final DriverRegisterationRepo driverRegisterationRepo;
  DriverRegisterModel driverRegisterModel = DriverRegisterModel();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  fetchDriverRegisteration() async {
    driverRegisterModel.driverType = true;
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      // log(driverRegisterModel.toJson().toString());
      emit(DriverRegisterationLoading());
      var result = await driverRegisterationRepo.fetchRegisteration(
          driverDetails: driverRegisterModel);
      result.fold(
          (fail) => emit(DriverRegisterationFailure(errmsg: fail.errMessage)),
          (success) => emit(DriverRegisterationSuccess()));
    } //just for now
  }
}
