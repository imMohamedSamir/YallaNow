part of 'order_request_cubit.dart';

sealed class OrderRequestState extends Equatable {
  const OrderRequestState();

  @override
  List<Object> get props => [];
}

final class OrderRequestInitial extends OrderRequestState {}
