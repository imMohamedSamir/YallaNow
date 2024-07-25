part of 'driver_registeration_cubit.dart';

sealed class DriverRegisterationState extends Equatable {
  const DriverRegisterationState();

  @override
  List<Object> get props => [];
}

final class DriverRegisterationInitial extends DriverRegisterationState {}

final class DriverRegisterationSuccess extends DriverRegisterationState {}

final class DriverRegisterationLoading extends DriverRegisterationState {}

final class DriverRegisterationFailure extends DriverRegisterationState {
  final String errmsg;

  const DriverRegisterationFailure({required this.errmsg});
}
