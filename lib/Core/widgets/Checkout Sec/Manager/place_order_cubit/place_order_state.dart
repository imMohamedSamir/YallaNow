part of 'place_order_cubit.dart';

sealed class PlaceOrderState extends Equatable {
  const PlaceOrderState();

  @override
  List<Object> get props => [];
}

final class PlaceOrderInitial extends PlaceOrderState {}

final class PlaceOrderLoading extends PlaceOrderState {}

final class PlaceOrderSuccess extends PlaceOrderState {
  final dynamic response;

  const PlaceOrderSuccess({required this.response});
}

final class PlaceOrderFailure extends PlaceOrderState {
  final String errMsg;

  const PlaceOrderFailure({required this.errMsg});
}
