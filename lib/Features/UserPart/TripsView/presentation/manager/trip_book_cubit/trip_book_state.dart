part of 'trip_book_cubit.dart';

sealed class TripBookState extends Equatable {
  const TripBookState();

  @override
  List<Object> get props => [];
}

final class TripBookInitial extends TripBookState {}

final class TripBookLoading extends TripBookState {}

final class TripBookSuccess extends TripBookState {}

final class TripBookFailure extends TripBookState {
  final String errMsg;

  const TripBookFailure({required this.errMsg});
}
