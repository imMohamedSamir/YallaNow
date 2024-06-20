part of 'ride_request_cubit.dart';

sealed class RideRequestState extends Equatable {
  const RideRequestState();

  @override
  List<Object> get props => [];
}

final class RideRequestInitial extends RideRequestState {}
