import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Core/utlis/paymob_manager.dart';

part 'check_payment_method_state.dart';

enum PaymentMethod {
  cash,
  creditCard,
}

class CheckPaymentMethodCubit extends Cubit<CheckPaymentMethodState> {
  CheckPaymentMethodCubit() : super(CheckPaymentMethodInitial());
  void updatePaymentMethod({required PaymentMethod method}) {
    if (method == PaymentMethod.creditCard) {
      // print(method);
      emit(CheckPaymentMethodCreditMethod());
    } else {
      emit(CheckPaymentMethodInitial());
    }
  }

  Future<String> goToPaymentPage({
    required int amount,
  }) async {
    emit(CheckPaymentMethodLoading());
    String PaymentKey = await PaymobManager().getPaymentKey(amount: amount);
    emit(CheckPaymentMethodSuccess());
    emit(CheckPaymentMethodCreditMethod());

    return PaymentKey;
  }
}
