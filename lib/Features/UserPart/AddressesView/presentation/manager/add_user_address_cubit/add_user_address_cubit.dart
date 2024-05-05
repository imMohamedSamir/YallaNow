import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/Repo/AddressRepo.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/UserInputAddressModel.dart';

part 'add_user_address_state.dart';

class AddUserAddressCubit extends Cubit<AddUserAddressState> {
  AddUserAddressCubit(this.addressesRepo) : super(AddUserAddressInitial());
  final AddressesRepo addressesRepo;
  void addAddress({required UserInputAddressModel newaddress}) async {
    emit(AddUserAddressLoading());
    var result = await addressesRepo.addNewUserAddresses(
        userAddressDetailsModel: newaddress);
    result.fold(
        (faile) => emit(AddUserAddressFailure(errMsg: faile.errMessage)),
        (r) => emit(AddUserAddressSuccess()));
  }
}
