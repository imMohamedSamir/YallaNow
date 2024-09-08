part of 'payment_web_view_cubit.dart';

sealed class PaymentWebViewState extends Equatable {
  const PaymentWebViewState();

  @override
  List<Object> get props => [];
}

final class PaymentWebViewInitial extends PaymentWebViewState {}

final class PaymentWebViewLoading extends PaymentWebViewState {}

final class PaymentWebViewFailure extends PaymentWebViewState {}

final class PaymentWebViewSuccess extends PaymentWebViewState {}
