part of 'mart_items_cubit.dart';

sealed class MartItemsState extends Equatable {
  const MartItemsState();

  @override
  List<Object> get props => [];
}

final class MartItemsInitial extends MartItemsState {}

final class MartItemsLoading extends MartItemsState {}

final class MartItemsSuccess extends MartItemsState {
  final List<MartItem> items;

  const MartItemsSuccess({required this.items});
}

final class MartItemsFailure extends MartItemsState {
  final String errMsg;

  const MartItemsFailure({required this.errMsg});
}
