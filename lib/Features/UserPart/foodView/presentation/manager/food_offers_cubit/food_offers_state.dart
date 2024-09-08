part of 'food_offers_cubit.dart';

sealed class FoodOffersState extends Equatable {
  const FoodOffersState();

  @override
  List<Object> get props => [];
}

final class FoodOffersInitial extends FoodOffersState {}

final class FoodOffersLoading extends FoodOffersState {}

final class FoodOffersSuccess extends FoodOffersState {
  final List<OfferDetailsModel> offers;

  const FoodOffersSuccess({required this.offers});
}

final class FoodOffersFailure extends FoodOffersState {}
