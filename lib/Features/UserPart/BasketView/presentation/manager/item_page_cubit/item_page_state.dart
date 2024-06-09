part of 'item_page_cubit.dart';

sealed class ItemPageState extends Equatable {
  const ItemPageState();

  @override
  List<Object> get props => [];
}

final class ItemPageInitial extends ItemPageState {}

final class ItemPageAdded extends ItemPageState {}

final class ItemPageOtherPartner extends ItemPageState {}

final class ItemPageChange extends ItemPageState {
  final String updatedPrice;
  final bool isOtherPartner;
  final bool selectedSize;
  const ItemPageChange(
      {required this.updatedPrice,
      this.isOtherPartner = false,
      this.selectedSize = false});
}
