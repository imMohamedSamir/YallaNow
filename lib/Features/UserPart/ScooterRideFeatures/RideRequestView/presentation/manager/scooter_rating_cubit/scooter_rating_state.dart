part of 'scooter_rating_cubit.dart';

sealed class ScooterRatingState extends Equatable {
  const ScooterRatingState();

  @override
  List<Object> get props => [];
}

final class ScooterRatingInitial extends ScooterRatingState {}

final class ScooterRatingLoading extends ScooterRatingState {}

final class ScooterRatingSuccess extends ScooterRatingState {}

final class ScooterRatingFailure extends ScooterRatingState {
  final String errmsg;

  ScooterRatingFailure({required this.errmsg});
}
