part of 'ride_price_cubit.dart';

sealed class RidePriceState extends Equatable {
  const RidePriceState();

  @override
  List<Object> get props => [];
}

final class RidePriceInitial extends RidePriceState {}

final class RidePriceLoading extends RidePriceState {}

final class RidePriceSuccess extends RidePriceState {
  final RidePricesModel pricesModel;

  const RidePriceSuccess({required this.pricesModel});
}

final class RidePriceFailure extends RidePriceState {
  final String errMsg;

  const RidePriceFailure({required this.errMsg});
}
