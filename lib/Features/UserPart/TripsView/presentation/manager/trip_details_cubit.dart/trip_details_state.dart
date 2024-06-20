part of 'trip_details_cubit.dart';

sealed class TripDetailsState extends Equatable {
  const TripDetailsState();

  @override
  List<Object> get props => [];
}

final class TripDetailsInitial extends TripDetailsState {}

final class TripDetailsLoading extends TripDetailsState {}

final class TripDetailsSuccess extends TripDetailsState {
  final TripInfoModel trip;

  const TripDetailsSuccess({required this.trip});
}

final class TripDetailsFailure extends TripDetailsState {
  final String errMsg;

  const TripDetailsFailure({required this.errMsg});
}
