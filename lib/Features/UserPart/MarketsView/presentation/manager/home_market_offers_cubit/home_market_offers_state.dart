part of 'home_market_offers_cubit.dart';

sealed class HomeMarketOffersState extends Equatable {
  const HomeMarketOffersState();

  @override
  List<Object> get props => [];
}

final class HomeMarketOffersInitial extends HomeMarketOffersState {}

final class HomeMarketOffersLoading extends HomeMarketOffersState {}

final class HomeMarketOffersSuccess extends HomeMarketOffersState {
  final List<OfferDetailsModel> offers;

  const HomeMarketOffersSuccess({required this.offers});
}

final class HomeMarketOffersFailure extends HomeMarketOffersState {}
