import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/utlis/YallaNowServices.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/Repos/ScooterRequestRepo.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/models/ride_request_model.dart';

class ScooterRequestRepoImpl implements ScooterRequestRepo {
  final YallaNowServices yallaNowServices;

  ScooterRequestRepoImpl({required this.yallaNowServices});
  @override
  Future<Either<Failure, dynamic>> getPredictions(
      {required RideRequestModel request}) async {
    String endPoint = 'TripRequests/send Ride Request';
    try {
      var response =
          await yallaNowServices.post(endPoint: endPoint, body: request);

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
