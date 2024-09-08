import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/Repos/ScooterRequestRepo.dart';

part 'check_wallet_balance_state.dart';

class CheckWalletBalanceCubit extends Cubit<CheckWalletBalanceState> {
  CheckWalletBalanceCubit(this._repo) : super(CheckWalletBalanceInitial());
  final ScooterRequestRepo _repo;
  void check(double value) async {
    emit(CheckWalletBalanceLoading());
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
