part of 'mart_trending_items_cubit.dart';

sealed class MartTrendingItemsState extends Equatable {
  const MartTrendingItemsState();

  @override
  List<Object> get props => [];
}

final class MartTrendingItemsInitial extends MartTrendingItemsState {}

final class MartTrendingItemsLoading extends MartTrendingItemsState {}

final class MartTrendingItemsSuccess extends MartTrendingItemsState {
  final List<MartItem> items;

  const MartTrendingItemsSuccess({required this.items});
}

final class MartTrendingItemsFailure extends MartTrendingItemsState {}
