part of 'manage_basket_cubit.dart';

sealed class ManageBasketState extends Equatable {
  const ManageBasketState();

  @override
  List<Object> get props => [];
}

final class ManageBasketInitial extends ManageBasketState {}
