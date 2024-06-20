part of 'scooter_request_cubit.dart';

sealed class ScooterRequestState extends Equatable {
  const ScooterRequestState();

  @override
  List<Object> get props => [];
}

final class ScooterRequestInitial extends ScooterRequestState {}

final class ScooterRequestLoading extends ScooterRequestState {}

final class ScooterRequestSuccess extends ScooterRequestState {}

final class ScooterRequestAccepted extends ScooterRequestState {
  final RequestDetails requestData;

  const ScooterRequestAccepted({required this.requestData});
}

final class ScooterRequestShowRequest extends ScooterRequestState {
  final RequestDetails requestData;

  const ScooterRequestShowRequest({required this.requestData});
}

final class ScooterRequestSent extends ScooterRequestState {
  final RequestModel requestData;

  const ScooterRequestSent({required this.requestData});
}

final class ScooterRequestDriverAccepted extends ScooterRequestState {}

final class ScooterRequestFailure extends ScooterRequestState {}

final class ScooterRequestDisabled extends ScooterRequestState {}
