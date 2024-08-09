import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/utlis/FirebaseMessagingService.dart';
import 'package:yallanow/Core/utlis/TokenManger.dart';
import 'package:yallanow/Core/utlis/YallaNowServices.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/Repos/ScooterRequestRepo.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/models/ride_rating_model.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/models/user_request_model.dart';
import 'package:yallanow/generated/l10n.dart';
import 'package:yallanow/main.dart';

class ScooterRequestRepoImpl implements ScooterRequestRepo {
  final YallaNowServices yallaNowServices;
  final FirebaseMessagingService firebaseMessagingService;
  ScooterRequestRepoImpl({
    required this.yallaNowServices,
    required this.firebaseMessagingService,
  });

  @override
  Future<Either<Failure, dynamic>> sendRequest(
      {required UserRequestModel request}) async {
    String endPoint = 'Ride/request';
    String token = await TokenManager.getUserToken() ?? "";
    request.deviceToken = await firebaseMessagingService.getToken();
    log(request.toJson().toString());

    try {
      var response = await yallaNowServices.post(
          endPoint: endPoint, body: request.toJson(), token: token);

      return right(response);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        log(e.response.toString());
        if (e.response.toString() == "No drivers available.") {
          return left(
              ServerFailure(S.of(navigatorKey.currentContext!).NoDriversMsg));
        } else {
          return left(
              ServerFailure.fromResponse(e.response!.statusCode, e.response));
        }
      }

      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, dynamic>> tripRating(
      {required RideRatingModel rating}) async {
    String endPoint = 'Ride/RateTrip';
    String token = await TokenManager.getUserToken() ?? "";

    try {
      var response = await yallaNowServices.post(
          endPoint: endPoint, body: rating.toJson(), token: token);

      return right(response);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        log(e.response.toString());
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
  Future<Either<Failure, dynamic>> applyPromoCode(
      {required String userId, required String promoCode}) async {
    String endPoint = 'PromoCode/apply';
    String token = await TokenManager.getUserToken() ?? "";

    try {
      var response = await yallaNowServices.post(
        endPoint: endPoint,
        body: jsonEncode({"userId": userId, "promoCode": promoCode}),
      );

      return right(response);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        log(e.response.toString());
        return left(
          ServerFailure.fromResponse(e.response!.statusCode, e.response),
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
  Future<Either<Failure, dynamic>> cancelPromoCode(
      {required String userId, required String promoCode}) async {
    String endPoint = 'PromoCode/cancel';
    String token = await TokenManager.getUserToken() ?? "";

    try {
      var response = await yallaNowServices.post(
          endPoint: endPoint,
          body: jsonEncode({"userId": userId, "promoCode": promoCode}),
          token: token);

      return right(response);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        log(e.response.toString());
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
  Future<Either<Failure, dynamic>> checkbalance({required double value}) async {
    String endPoint = 'Wallets/check-balance?value=$value';
    String token = await TokenManager.getUserToken() ?? "";

    try {
      var response =
          await yallaNowServices.get(endPoint: endPoint, token: token);

      return right(response);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        log(e.response.toString());
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
