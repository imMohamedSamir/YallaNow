part of 'send_request_cubit.dart';

sealed class SendRequestState extends Equatable {
  const SendRequestState();

  @override
  List<Object> get props => [];
}

final class SendRequestInitial extends SendRequestState {}

final class SendRequestLoading extends SendRequestState {}

final class SendRequestSuccess extends SendRequestState {
  final UserRequestModel requestModel;

  SendRequestSuccess({required this.requestModel});
}

final class SendRequestFailure extends SendRequestState {
  final String errMsg;

  const SendRequestFailure({required this.errMsg});
}
