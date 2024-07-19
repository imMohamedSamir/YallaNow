part of 'UserRidRequestCubit.dart';

sealed class UserRideRequestState extends Equatable {
  const UserRideRequestState();

  @override
  List<Object> get props => [];
}

final class UserRideRequestInitial extends UserRideRequestState {}

final class UserRideRequestLoading extends UserRideRequestState {}

final class UserRideRequestSuccess extends UserRideRequestState {}

final class UserRideRequestFailure extends UserRideRequestState {}

final class UserRideRequestAccepted extends UserRideRequestState {
  final AcceptRideModel driverInfoModel;
  final bool isStarted;

  const UserRideRequestAccepted(
      {required this.driverInfoModel, this.isStarted = false});
}

final class UserRideRequesConnected extends UserRideRequestState {}
