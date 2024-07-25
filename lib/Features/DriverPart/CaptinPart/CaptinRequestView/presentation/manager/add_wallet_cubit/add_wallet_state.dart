part of 'add_wallet_cubit.dart';

sealed class AddWalletState extends Equatable {
  const AddWalletState();

  @override
  List<Object> get props => [];
}

final class AddWalletInitial extends AddWalletState {}

final class AddWalletLoading extends AddWalletState {}

final class AddWalletSuccess extends AddWalletState {}

final class AddWalletChange extends AddWalletState {
  final double value;
  final AutovalidateMode? autovalidateMode;
  const AddWalletChange({required this.value, this.autovalidateMode});
}

final class AddWalletFailure extends AddWalletState {
  final String errMsg;

  const AddWalletFailure({required this.errMsg});
}
