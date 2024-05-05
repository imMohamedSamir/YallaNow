part of 'delete_address_cubit.dart';

sealed class DeleteAddressState extends Equatable {
  const DeleteAddressState();

  @override
  List<Object> get props => [];
}

final class DeleteAddressInitial extends DeleteAddressState {}

final class DeleteAddressLoading extends DeleteAddressState {}

final class DeleteAddressFailure extends DeleteAddressState {
  final String errmsg;

  const DeleteAddressFailure({required this.errmsg});
}

final class DeleteAddressSuccess extends DeleteAddressState {}
