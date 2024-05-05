part of 'add_user_address_cubit.dart';

sealed class AddUserAddressState extends Equatable {
  const AddUserAddressState();

  @override
  List<Object> get props => [];
}

final class AddUserAddressInitial extends AddUserAddressState {}

final class AddUserAddressLoading extends AddUserAddressState {}

final class AddUserAddressFailure extends AddUserAddressState {
  final String errMsg;

  const AddUserAddressFailure({required this.errMsg});
}

final class AddUserAddressSuccess extends AddUserAddressState {}
