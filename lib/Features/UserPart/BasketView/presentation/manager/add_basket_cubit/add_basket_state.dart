part of 'add_basket_cubit.dart';

sealed class AddBasketState extends Equatable {
  const AddBasketState();

  @override
  List<Object> get props => [];
}

final class AddBasketInitial extends AddBasketState {}

final class AddBasketLoading extends AddBasketState {}

final class AddBasketSuccess extends AddBasketState {}

final class AddBasketFailure extends AddBasketState {
  final String errmsg;

  const AddBasketFailure({required this.errmsg});
}
