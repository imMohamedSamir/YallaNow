part of 'captin_start_trip_cubit.dart';

sealed class CaptinStartTripState extends Equatable {
  const CaptinStartTripState();

  @override
  List<Object> get props => [];
}

final class CaptinStartTripInitial extends CaptinStartTripState {}

final class CaptinStartTriploading extends CaptinStartTripState {}

final class CaptinStartTripStarted extends CaptinStartTripState {}

final class CaptinStartTripEnded extends CaptinStartTripState {}

final class CaptinStartTripFailure extends CaptinStartTripState {
  final String errMsg;

  const CaptinStartTripFailure({required this.errMsg});
}
