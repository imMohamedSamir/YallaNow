import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/Repo/AddressRepo.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/user_addresses_details_model/user_addresses_details_model.dart';

part 'user_addresses_state.dart';

class UserAddressesCubit extends Cubit<UserAddressesState> {
  UserAddressesCubit(this.addressesRepo) : super(UserAddressesInitial());
  final AddressesRepo addressesRepo;
  void getUserAddresses() async {
    emit(UserAddressesLoading());
    var result = await addressesRepo.fetchUserAddresses();
    result.fold(
        (failure) => emit(UserAddressesFailure(errMsg: failure.errMessage)),
        (addresses) {
      if (addresses.isEmpty) {
        emit(UserAddressesEmpty());
      } else {
        emit(UserAddressesLoading());
        emit(UserAddressesSuccess(addresses: addresses));
      }
    });
  }
}
