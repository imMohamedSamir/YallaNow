import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/Repo/AddressRepo.dart';

part 'delete_address_state.dart';

class DeleteAddressCubit extends Cubit<DeleteAddressState> {
  DeleteAddressCubit(this.addressesRepo) : super(DeleteAddressInitial());
  final AddressesRepo addressesRepo;
  Future deleteAddress({required String addressId}) async {
    emit(DeleteAddressLoading());
    var result = await addressesRepo.deleteUserAddresses(addressId: addressId);
    result.fold(
        (failuer) => emit(DeleteAddressFailure(errmsg: failuer.errMessage)),
        (response) => emit(DeleteAddressSuccess()));
  }
}
