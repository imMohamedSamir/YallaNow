import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/Repos/ScooterRequestRepo.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/send_request_cubit/send_request_cubit.dart';

part 'check_wallet_balance_state.dart';

class CheckWalletBalanceCubit extends Cubit<CheckWalletBalanceState> {
  CheckWalletBalanceCubit(this._repo) : super(CheckWalletBalanceInitial());
  final ScooterRequestRepo _repo;
  void check(BuildContext context) async {
    emit(CheckWalletBalanceLoading());
    double value = double.parse(
        BlocProvider.of<SendRequestCubit>(context).requestModel.price!);
    log(value.toString());
    var result = await _repo.checkbalance(value: value);
    result.fold(
        (fail) => emit(CheckWalletBalanceFailure(errMsg: fail.errMessage)),
        (response) {
      log(response["success"].toString());
      emit(CheckWalletBalanceSuccess(valid: response["success"]));
    });
  }
}
