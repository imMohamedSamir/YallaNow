part of 'basket_manager_cubit.dart';

sealed class BasketManagerState extends Equatable {
  const BasketManagerState();

  @override
  List<Object> get props => [];
}

final class BasketManagerInitial extends BasketManagerState {}

final class BasketManagerLoading extends BasketManagerState {}

final class BasketManagerAdd extends BasketManagerState {
  final List<SelectedItemsModel> items;
  final String totalPrice, totalpriceDetails;
  const BasketManagerAdd({
    required this.items,
    required this.totalPrice,
    required this.totalpriceDetails,
  });
}

final class BasketManagerDelete extends BasketManagerState {
  final List<SelectedItemsModel> items;
  final String totalPrice, totalpriceDetails;

  const BasketManagerDelete({
    required this.items,
    required this.totalPrice,
    required this.totalpriceDetails,
  });
}

final class BasketManagerTotalDetails extends BasketManagerState {
  final String totalPrice;

  const BasketManagerTotalDetails({required this.totalPrice});
}

final class BasketManagerShow extends BasketManagerState {}

final class BasketManagerIsSelected extends BasketManagerState {}

final class BasketManagerChangeQty extends BasketManagerState {
  final String price;

  const BasketManagerChangeQty({required this.price});
}

final class BasketManagerSize extends BasketManagerState {
  final String price;

  const BasketManagerSize({required this.price});
}

final class BasketManagerFail extends BasketManagerState {
  final String errmsg;

  const BasketManagerFail({required this.errmsg});
}
