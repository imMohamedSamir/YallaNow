part of 'user_addresses_cubit.dart';

sealed class UserAddressesState extends Equatable {
  const UserAddressesState();

  @override
  List<Object> get props => [];
}

final class UserAddressesInitial extends UserAddressesState {}

final class UserAddressesLoading extends UserAddressesState {}

final class UserAddressesEmpty extends UserAddressesState {}

final class UserAddressesFailure extends UserAddressesState {
  final String errMsg;

  const UserAddressesFailure({required this.errMsg});
}

final class UserAddressesSuccess extends UserAddressesState {
  final List<UserAddressesDetailsModel> addresses;

  const UserAddressesSuccess({required this.addresses});
}

final class UserAddressesAdded extends UserAddressesState {
  final List<UserAddressesDetailsModel> addresses;

  const UserAddressesAdded({required this.addresses});
}
