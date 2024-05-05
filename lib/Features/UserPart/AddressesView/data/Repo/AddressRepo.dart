import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/UserInputAddressModel.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/user_addresses_details_model/user_addresses_details_model.dart';

abstract class AddressesRepo {
  Future<Either<Failure, List<PlaceModel>>> getPredictions(
      {required String input});
  Future<Either<Failure, List<UserAddressesDetailsModel>>> fetchUserAddresses();
  Future<Either<Failure, dynamic>> addNewUserAddresses(
      {required UserInputAddressModel userAddressDetailsModel});
  Future<Either<Failure, dynamic>> deleteUserAddresses(
      {required String addressId});
}
