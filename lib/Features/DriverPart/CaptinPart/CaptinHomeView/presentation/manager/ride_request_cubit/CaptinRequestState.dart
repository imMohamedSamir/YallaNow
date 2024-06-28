part of 'CaptinRequestCubit.dart';

sealed class CaptinRequestState extends Equatable {
  const CaptinRequestState();

  @override
  List<Object> get props => [];
}

final class CaptinRequestInitial extends CaptinRequestState {}

final class CaptinRequestLoading extends CaptinRequestState {}

final class CaptinRequestConnected extends CaptinRequestState {}

final class CaptinRequestFailuer extends CaptinRequestState {}

final class CaptinRequestLocUpdated extends CaptinRequestState {}

final class CaptinRequestDisabled extends CaptinRequestState {}

final class CaptinRequestJoinded extends CaptinRequestState {}

final class CaptinRequestLeaved extends CaptinRequestState {}

final class CaptinRequestAccepted extends CaptinRequestState {
  final RequestDetails requestDetails;

  const CaptinRequestAccepted({required this.requestDetails});
}
