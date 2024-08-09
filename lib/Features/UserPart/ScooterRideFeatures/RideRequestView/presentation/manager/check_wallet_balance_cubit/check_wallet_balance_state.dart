part of 'check_wallet_balance_cubit.dart';

sealed class CheckWalletBalanceState extends Equatable {
  const CheckWalletBalanceState();

  @override
  List<Object> get props => [];
}

final class CheckWalletBalanceInitial extends CheckWalletBalanceState {}

final class CheckWalletBalanceLoading extends CheckWalletBalanceState {}

final class CheckWalletBalanceSuccess extends CheckWalletBalanceState {
  final bool valid;

  const CheckWalletBalanceSuccess({required this.valid});
}

final class CheckWalletBalanceFailure extends CheckWalletBalanceState {
  final String errMsg;

  const CheckWalletBalanceFailure({required this.errMsg});
}
