part of 'home_offers_cubit.dart';

sealed class HomeOffersState extends Equatable {
  const HomeOffersState();

  @override
  List<Object> get props => [];
}

final class HomeOffersInitial extends HomeOffersState {}

final class HomeOffersLoading extends HomeOffersState {}

final class HomeOffersSuccess extends HomeOffersState {
  final List offers;

  const HomeOffersSuccess({required this.offers});
}

final class HomeOffersFailure extends HomeOffersState {}
