part of 'basket_manager_cubit.dart';

sealed class BasketManagerState extends Equatable {
  const BasketManagerState();

  @override
  List<Object> get props => [];
}

final class BasketManagerInitial extends BasketManagerState {}

final class BasketManagerLoading extends BasketManagerState {}

final class BasketManagerChange extends BasketManagerState {
  final List<SelectedItemsModel> items;
  final String? totalPrice, priceDetails;
  final bool isConfirmed;
  const BasketManagerChange({
    required this.items,
    this.totalPrice,
    this.priceDetails,
    this.isConfirmed = true,
  });
}
