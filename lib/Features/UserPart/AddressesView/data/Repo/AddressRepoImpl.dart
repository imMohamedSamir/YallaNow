import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/utlis/Google_Api_services.dart';
import 'package:yallanow/Core/utlis/Keys.dart';
import 'package:yallanow/Core/utlis/TokenManger.dart';
import 'package:yallanow/Core/utlis/YallaNowServices.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/Repo/AddressRepo.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/UserInputAddressModel.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/user_addresses_details_model/user_addresses_details_model.dart';

class AddressesRepoImpl implements AddressesRepo {
  final GoogleMapsServices googleMapsServices;
  final YallaNowServices yallaNowServices;
  final String placesApiKey = 'AIzaSyC5oitatJsw_65vQ0F6e957BnzntH69rVQ';
  AddressesRepoImpl(this.googleMapsServices, this.yallaNowServices);

  @override
  Future<Either<Failure, List<PlaceModel>>> getPredictions(
      {required String input, String? sesstionToken}) async {
    String endPoint =
        'place/autocomplete/json?key=$googleApiKey&input=$input,&sessiontoken=$sesstionToken&components=country:eg&location=27.2579,33.8116&language=ar&radius=460500';

    try {
      var data = await googleMapsServices.getPreditction(endPoint: endPoint);
      if (data['error_message'] != null) {
        return left(ServerFailure(data['status']));
      }
      var predictions = data['predictions'];
      List<PlaceModel> places = [];
      for (var item in predictions) {
        places.add(PlaceModel.fromJson(item));
      }
      return right(places);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e.type),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  String? usertoken;
  @override
  Future<Either<Failure, List<UserAddressesDetailsModel>>>
      fetchUserAddresses() async {
    String endPoint = "UserAddress/get";
    usertoken = await TokenManager.getUserToken();

    try {
      var response =
          await yallaNowServices.get(endPoint: endPoint, token: usertoken);
      List<UserAddressesDetailsModel> addresses = [];
      for (var address in response) {
        addresses.add(UserAddressesDetailsModel.fromJson(address));
      }
      return right(addresses);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(
          ServerFailure.fromResponse(e.response?.statusCode, e.response),
        );
      }

      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, dynamic>> addNewUserAddresses(
      {required UserInputAddressModel userAddressDetailsModel}) async {
    String endPoint = "UserAddress/add";
    usertoken = await TokenManager.getUserToken();
    try {
      var response = await yallaNowServices.post(
        endPoint: endPoint,
        token: usertoken,
        body: userAddressDetailsModel.toJson(),
      );
      log(response.toString());

      return right(response);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e.type),
        );
      }

      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, dynamic>> deleteUserAddresses(
      {required String useraddressId, required String addressId}) async {
    String endPoint =
        "UserAddress/delete/$addressId?useraddressId=$useraddressId";
    usertoken = await TokenManager.getUserToken();

    try {
      var response =
          await yallaNowServices.delete(endPoint: endPoint, token: usertoken);

      return right(response);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e.type),
        );
      }

      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
