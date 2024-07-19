part of 'password_reset_request_cubit.dart';

sealed class PasswordResetRequestState extends Equatable {
  const PasswordResetRequestState();

  @override
  List<Object> get props => [];
}

final class PasswordResetRequestInitial extends PasswordResetRequestState {}

final class PasswordResetRequestLoading extends PasswordResetRequestState {}

final class PasswordResetRequestSuccess extends PasswordResetRequestState {}

final class PasswordResetRequestFailure extends PasswordResetRequestState {
  final String errMsg;

  const PasswordResetRequestFailure({required this.errMsg});
}
