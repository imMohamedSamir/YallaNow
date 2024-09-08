part of 'mart_discount_cubit.dart';

sealed class MartDiscountState extends Equatable {
  const MartDiscountState();

  @override
  List<Object> get props => [];
}

final class MartDiscountInitial extends MartDiscountState {}

final class MartDiscountLoading extends MartDiscountState {}

final class MartDiscountSuccess extends MartDiscountState {
  final List<MartItem> items;

  const MartDiscountSuccess({required this.items});
}

final class MartDiscountFailure extends MartDiscountState {}
