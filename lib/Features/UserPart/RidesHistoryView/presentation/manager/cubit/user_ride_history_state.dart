part of 'user_ride_history_cubit.dart';

sealed class UserRideHistoryState extends Equatable {
  const UserRideHistoryState();

  @override
  List<Object> get props => [];
}

final class UserRideHistoryInitial extends UserRideHistoryState {}

final class UserRideHistoryLoading extends UserRideHistoryState {}

final class UserRideHistorySuccess extends UserRideHistoryState {
  final List<UserRideHistoryModel> rides;

  const UserRideHistorySuccess({required this.rides});
}

final class UserRideHistoryFailure extends UserRideHistoryState {
  final String errMsg;

  const UserRideHistoryFailure({required this.errMsg});
}
