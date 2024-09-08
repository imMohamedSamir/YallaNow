import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/paymob_manager.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Features/UserPart/ProfileView/data/Repo/ProfileRepoImpl.dart';

part 'check_payment_method_state.dart';

enum PaymentMethod { cash, wallet, creditCard }

class CheckPaymentMethodCubit extends Cubit<CheckPaymentMethodState> {
  CheckPaymentMethodCubit() : super(CheckPaymentMethodInitial());
  void updatePaymentMethod({required PaymentMethod method}) {
    emit(CheckPaymentMethodInitial());
    if (method == PaymentMethod.creditCard) {
      // print(method);
      emit(CheckPaymentMethodChange(methode: method));
    } else if (method == PaymentMethod.wallet) {
      emit(CheckPaymentMethodChange(methode: method));
    } else {
      emit(CheckPaymentMethodInitial());
    }
    log(method.name);
  }

  void goToPaymentPage(BuildContext context, {required double amount}) async {
    emit(const CheckPaymentMethodLoading(methode: PaymentMethod.creditCard));
    var result = await PaymobManager(profileRepo: getIt.get<ProfileRepoImpl>())
        .getPaymentKey(amount: amount);
    result.fold((fail) {
      log(fail.errMessage);
      emit(CheckPaymentMethodFailuer(errMsg: fail.errMessage));
    }, (paymentKey) {
      emit(CheckPaymentMethodChange(
          methode: PaymentMethod.creditCard,
          isCredit: true,
          paymentKey: paymentKey));
      log(paymentKey);
    });
  }
}
