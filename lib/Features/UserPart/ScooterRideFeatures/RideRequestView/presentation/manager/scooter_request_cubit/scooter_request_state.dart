part of 'scooter_request_cubit.dart';

sealed class ScooterRequestState extends Equatable {
  const ScooterRequestState();

  @override
  List<Object> get props => [];
}

final class ScooterRequestInitial extends ScooterRequestState {}

final class ScooterRequestSuccess extends ScooterRequestState {}

final class ScooterRequestFailure extends ScooterRequestState {}
