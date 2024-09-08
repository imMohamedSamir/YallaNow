import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/Repo/AddressRepo.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/UserInputAddressModel.dart';

part 'add_user_address_state.dart';

class AddUserAddressCubit extends Cubit<AddUserAddressState> {
  AddUserAddressCubit(this.addressesRepo) : super(AddUserAddressInitial());
  final AddressesRepo addressesRepo;
  final formKey = GlobalKey<FormState>();

  UserInputAddressModel newaddress = UserInputAddressModel();
  void addAddress() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      emit(AddUserAddressLoading());
      var result = await addressesRepo.addNewUserAddresses(
          userAddressDetailsModel: newaddress);
      result.fold(
          (faile) => emit(AddUserAddressFailure(errMsg: faile.errMessage)),
          (r) => emit(AddUserAddressSuccess()));
    }
  }
}
