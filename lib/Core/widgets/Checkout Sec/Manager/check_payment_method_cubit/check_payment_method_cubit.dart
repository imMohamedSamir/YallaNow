import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/utlis/paymob_manager.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/PaymentWebView.dart';

part 'check_payment_method_state.dart';

enum PaymentMethod { cash, creditCard, wallet }

class CheckPaymentMethodCubit extends Cubit<CheckPaymentMethodState> {
  CheckPaymentMethodCubit() : super(CheckPaymentMethodInitial());
  void updatePaymentMethod({required PaymentMethod method}) {
    emit(CheckPaymentMethodInitial());
    if (method == PaymentMethod.creditCard) {
      // print(method);
      emit(const CheckPaymentMethodChange(methode: "Credit Card"));
    } else if (method == PaymentMethod.wallet) {
      emit(CheckPaymentMethodChange(methode: method.name));
    } else {
      emit(CheckPaymentMethodInitial());
    }
    log(method.name);
  }

  void goToPaymentPage(
    BuildContext context, {
    required int amount,
  }) async {
    emit(const CheckPaymentMethodLoading(methode: "Credit Card"));
    var result = await PaymobManager().getPaymentKey(amount: amount);
    result.fold(
        (fail) => emit(CheckPaymentMethodFailuer(errMsg: fail.errMessage)),
        (paymentKey) {
      emit(const CheckPaymentMethodChange(methode: "Credit Card"));
      NavigateToPage.slideFromRight(
          context: context, page: PaymentWebView(paymentKey: paymentKey));
    });
  }
}
