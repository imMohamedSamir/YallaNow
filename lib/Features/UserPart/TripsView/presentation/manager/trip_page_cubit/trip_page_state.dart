part of 'trip_page_cubit.dart';

sealed class TripPageState extends Equatable {
  const TripPageState();

  @override
  List<Object> get props => [];
}

final class TripPageInitial extends TripPageState {}

final class TripPageScrolled extends TripPageState {
  final bool isTop;

  const TripPageScrolled({required this.isTop});
}
