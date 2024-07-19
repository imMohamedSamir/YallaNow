part of 'captin_trips_cubit.dart';

sealed class CaptinTripsState extends Equatable {
  const CaptinTripsState();

  @override
  List<Object> get props => [];
}

final class CaptinTripsInitial extends CaptinTripsState {}

final class CaptinTripsLoading extends CaptinTripsState {}

final class CaptinTripsSuccess extends CaptinTripsState {
  final CaptinTripsModel captinTripsModel;

  const CaptinTripsSuccess({required this.captinTripsModel});
}

final class CaptinTripsFailure extends CaptinTripsState {
  final String errMsg;

  const CaptinTripsFailure({required this.errMsg});
}
