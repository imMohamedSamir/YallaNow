part of 'market_offer_cubit.dart';

sealed class MarketOfferState extends Equatable {
  const MarketOfferState();

  @override
  List<Object> get props => [];
}

final class MarketOfferInitial extends MarketOfferState {}

final class MarketOfferLoading extends MarketOfferState {}

final class MarketOfferSuccess extends MarketOfferState {
  final List<OfferDetailsModel> offers;

  const MarketOfferSuccess({required this.offers});
}

final class MarketOfferFailure extends MarketOfferState {}
