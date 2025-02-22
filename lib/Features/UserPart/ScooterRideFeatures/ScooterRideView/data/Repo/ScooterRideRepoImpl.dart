import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/utlis/TokenManger.dart';
import 'package:yallanow/Core/utlis/YallaNowServices.dart';
import 'package:yallanow/Features/UserPart/RidesHistoryView/data/models/UserRideHistoryModel.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/data/Repo/ScooterRideRepo.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/data/models/ride_prices_model.dart';

class ScooterRideRepoImpl implements ScooterRideRepo {
  final YallaNowServices yallaNowServices;

  ScooterRideRepoImpl({required this.yallaNowServices});
  @override
  Future<Either<Failure, RidePricesModel>> getRidePrice(
      {required double distance, required int duration}) async {
    String endPoint =
        "TripRequests/calculate-price?distance=$distance&duration=$duration";
    try {
      var response = await yallaNowServices.get(endPoint: endPoint);
      return right(RidePricesModel.fromJson(response));
    } catch (e) {
      // log(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e.type));
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<UserRideHistoryModel>>> getRideHistory() async {
    String endPoint = "UserProfile/RideHistory";
    String token = await TokenManager.getUserToken() ?? "";
    try {
      var response =
          await yallaNowServices.get(endPoint: endPoint, token: token);
      log(response.toString());
      List<UserRideHistoryModel> rides = [];
      for (var ride in response["ridesHistory"]) {
        rides.add(UserRideHistoryModel.fromJson(ride));
      }
      return right(rides);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        log(e.response.toString());

        return left(
            ServerFailure.fromResponse(e.response?.statusCode, e.response));
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }
}
