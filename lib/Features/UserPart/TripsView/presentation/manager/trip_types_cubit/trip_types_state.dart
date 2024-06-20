part of 'trip_types_cubit.dart';

sealed class TripTypesState extends Equatable {
  const TripTypesState();

  @override
  List<Object> get props => [];
}

final class TripTypesInitial extends TripTypesState {}

final class TripTypesLoading extends TripTypesState {}

final class TripTypesSuccess extends TripTypesState {
  final List<dynamic> types;

  const TripTypesSuccess({required this.types});
}

final class TripTypesFailure extends TripTypesState {
  final String errmsg;

  const TripTypesFailure({required this.errmsg});
}
