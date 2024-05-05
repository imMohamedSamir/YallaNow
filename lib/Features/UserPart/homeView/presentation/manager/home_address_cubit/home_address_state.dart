part of 'home_address_cubit.dart';

sealed class HomeAddressState extends Equatable {
  const HomeAddressState();

  @override
  List<Object> get props => [];
}

final class HomeAddressInitial extends HomeAddressState {}

final class HomeAddressChange extends HomeAddressState {
  final UserAddressesDetailsModel address;

  const HomeAddressChange({required this.address});
}
