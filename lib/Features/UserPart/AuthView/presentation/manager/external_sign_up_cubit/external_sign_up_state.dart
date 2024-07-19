part of 'external_sign_up_cubit.dart';

sealed class ExternalSignUpState extends Equatable {
  const ExternalSignUpState();

  @override
  List<Object> get props => [];
}

final class ExternalSignUpInitial extends ExternalSignUpState {}

final class ExternalSignUpLoading extends ExternalSignUpState {}

final class ExternalSignUpSuccess extends ExternalSignUpState {}

final class ExternalSignUpFailure extends ExternalSignUpState {
  final String errMsg;

  const ExternalSignUpFailure({required this.errMsg});
}
