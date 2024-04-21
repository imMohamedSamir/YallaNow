part of 'check_payment_method_cubit.dart';

sealed class CheckPaymentMethodState extends Equatable {
  const CheckPaymentMethodState();

  @override
  List<Object> get props => [];
}

final class CheckPaymentMethodInitial extends CheckPaymentMethodState {}

final class CheckPaymentMethodSuccess extends CheckPaymentMethodState {}

final class CheckPaymentMethodLoading extends CheckPaymentMethodState {}

final class CheckPaymentMethodCreditMethod extends CheckPaymentMethodState {}
