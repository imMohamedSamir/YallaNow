part of 'pharmacy_offers_cubit.dart';

sealed class PharmacyOffersState extends Equatable {
  const PharmacyOffersState();

  @override
  List<Object> get props => [];
}

final class PharmacyOffersInitial extends PharmacyOffersState {}

final class PharmacyOffersLoading extends PharmacyOffersState {}

final class PharmacyOffersSuccess extends PharmacyOffersState {
  final List<OfferDetailsModel> offers;

  const PharmacyOffersSuccess({required this.offers});
}

final class PharmacyOffersFailure extends PharmacyOffersState {}
