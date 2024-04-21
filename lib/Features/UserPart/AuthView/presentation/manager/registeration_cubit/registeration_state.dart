part of 'registeration_cubit.dart';

sealed class RegisterationState extends Equatable {
  const RegisterationState();

  @override
  List<Object> get props => [];
}

final class RegisterationInitial extends RegisterationState {}

final class RegisterationLoading extends RegisterationState {}

final class RegisterationSuccess extends RegisterationState {
  final dynamic respons;

  RegisterationSuccess({required this.respons});
}

final class RegisterationFailure extends RegisterationState {
  final String failmsg;

  RegisterationFailure({required this.failmsg});
}
