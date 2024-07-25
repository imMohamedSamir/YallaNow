import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/Repo/CaptinRequestRepo.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/CaptinHomeView.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/manager/captin_ride_request_cubit/captin_ride_request_cubit.dart';

part 'add_wallet_state.dart';

class AddWalletCubit extends Cubit<AddWalletState> {
  AddWalletCubit(this._captinRequestRepo) : super(AddWalletInitial());
  final CaptinRequestRepo _captinRequestRepo;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  double? value;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  void add(BuildContext context) async {
    String userId =
        BlocProvider.of<CaptinRideRequestCubit>(context).requestModel.userId ??
            "EMPTY";
    emit(AddWalletLoading());
    if (key.currentState!.validate()) {
      // key.currentState!.save();
      log("$userId ,, $value");
      var result =
          await _captinRequestRepo.addToWallet(userId: userId, value: value!);
      result.fold((fail) => emit(AddWalletFailure(errMsg: fail.errMessage)),
          (respone) async {
        emit(AddWalletSuccess());
        await Future.delayed(const Duration(milliseconds: 400));
        if (context.mounted) {
          Navigator.pop(context);
          NavigateToPage.slideFromTop(
              context: context, page: const CaptinHomeView());
        }
      });
    }
  }

  void calculateTheValue(BuildContext context, {required double userValue}) {
    emit(AddWalletInitial());
    autovalidateMode = AutovalidateMode.onUserInteraction;
    double tripPrice =
        BlocProvider.of<CaptinRideRequestCubit>(context).requestModel.price ??
            0;
    value = (userValue - tripPrice).roundToDouble();

    emit(AddWalletChange(value: value!, autovalidateMode: autovalidateMode));
  }
}
