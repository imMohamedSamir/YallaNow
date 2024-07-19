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
  Future<Either<Failure, dynamic>> tripRating(
      {required RideRatingModel rating}) async {
    String endPoint = 'Ride/RateTrip';
    String token = await TokenManager.getUserToken() ?? "";
    log(rating.toJson().toString());

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
}
