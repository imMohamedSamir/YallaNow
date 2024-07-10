part of 'captin_ride_request_cubit.dart';

sealed class CaptinRideRequestState extends Equatable {
  const CaptinRideRequestState();

  @override
  List<Object> get props => [];
}

final class CaptinRideRequestInitial extends CaptinRideRequestState {}

final class CaptinRideRequestloading extends CaptinRideRequestState {}

final class CaptinRideRequestConnected extends CaptinRideRequestState {}

final class CaptinRideRequestDisConnected extends CaptinRideRequestState {}

final class CaptinRideRequestDisabled extends CaptinRideRequestState {}

final class CaptinRideRequestFailure extends CaptinRideRequestState {}

final class CaptinRideRequestjoided extends CaptinRideRequestState {}

final class CaptinRideRequestjAccepted extends CaptinRideRequestState {
  final CaptinRequestModel detailsModel;

  const CaptinRideRequestjAccepted({required this.detailsModel});
}
