part of 'basket_manager_cubit.dart';

sealed class BasketManagerState extends Equatable {
  const BasketManagerState();

  @override
  List<Object> get props => [];
}

final class BasketManagerInitial extends BasketManagerState {}

final class BasketManagerLoading extends BasketManagerState {}

final class BasketManagerAdd extends BasketManagerState {}

final class BasketManagerDelete extends BasketManagerState {}

final class BasketManagerShow extends BasketManagerState {}

final class BasketManagerFail extends BasketManagerState {
  final String errmsg;

  BasketManagerFail({required this.errmsg});
}
