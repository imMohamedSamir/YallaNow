part of 'check_payment_method_cubit.dart';

sealed class CheckPaymentMethodState extends Equatable {
  const CheckPaymentMethodState();

  @override
  List<Object> get props => [];
}

final class CheckPaymentMethodInitial extends CheckPaymentMethodState {}

final class CheckPaymentMethodSuccess extends CheckPaymentMethodState {}

final class CheckPaymentMethodFailuer extends CheckPaymentMethodState {
  final String errMsg;

  const CheckPaymentMethodFailuer({required this.errMsg});
}

final class CheckPaymentMethodChange extends CheckPaymentMethodState {
  final PaymentMethod methode;
  final bool isCredit;
  final String? paymentKey;
  const CheckPaymentMethodChange({
    required this.methode,
    this.isCredit = false,
    this.paymentKey,
  });
}

final class CheckPaymentMethodLoading extends CheckPaymentMethodState {
  final PaymentMethod methode;

  const CheckPaymentMethodLoading({required this.methode});
}
