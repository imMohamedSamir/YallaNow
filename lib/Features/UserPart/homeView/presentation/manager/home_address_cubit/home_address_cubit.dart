import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/user_addresses_details_model/user_addresses_details_model.dart';

part 'home_address_state.dart';

class HomeAddressCubit extends Cubit<HomeAddressState> {
  HomeAddressCubit() : super(HomeAddressInitial());
  void chooseAddress({required UserAddressesDetailsModel address}) {
    emit(HomeAddressInitial());
    emit(HomeAddressChange(address: address));
  }
}
