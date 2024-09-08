part of 'delivery_request_cubit.dart';

sealed class DeliveryRequestState extends Equatable {
  const DeliveryRequestState();

  @override
  List<Object> get props => [];
}

final class DeliveryRequestInitial extends DeliveryRequestState {}

final class DeliveryRequestLoading extends DeliveryRequestState {}

final class DeliveryRequestConnected extends DeliveryRequestState {}

final class DeliveryRequestDisconnected extends DeliveryRequestState {}

final class DeliveryRequestDisabled extends DeliveryRequestState {}

final class DeliveryRequestFailure extends DeliveryRequestState {}

final class DeliveryRequestJoined extends DeliveryRequestState {}

final class DeliveryRequestAccepted extends DeliveryRequestState {}
