part of 'ready_for_trips_cubit.dart';

sealed class ReadyForTripsState extends Equatable {
  const ReadyForTripsState();

  @override
  List<Object> get props => [];
}

final class ReadyForTripsInitial extends ReadyForTripsState {}

final class ReadyForTripsLoading extends ReadyForTripsState {}

final class ReadyForTripsSuccess extends ReadyForTripsState {}

final class ReadyForTripsFailure extends ReadyForTripsState {}
