import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/Repo/AddressRepo.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/user_addresses_cubit/user_addresses_cubit.dart';

part 'delete_address_state.dart';

class DeleteAddressCubit extends Cubit<DeleteAddressState> {
  DeleteAddressCubit(this.addressesRepo) : super(DeleteAddressInitial());
  final AddressesRepo addressesRepo;
  Future deleteAddress(BuildContext context,
      {required String addressId, required String useraddressId}) async {
    emit(DeleteAddressLoading());
    var result = await addressesRepo.deleteUserAddresses(
        addressId: addressId, useraddressId: useraddressId);
    result.fold(
        (failuer) => emit(DeleteAddressFailure(errmsg: failuer.errMessage)),
        (response) {
      emit(DeleteAddressSuccess());
      BlocProvider.of<UserAddressesCubit>(context).getUserAddresses();
    });
  }
}
