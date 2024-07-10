import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/utlis/TokenManger.dart';
import 'package:yallanow/Core/utlis/YallaNowServices.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/Repo/CaptinRequestRepo.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/CaptinCancelModel.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/CaptinResponseModel.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/ready_model.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/update_location_model.dart';

class CaptinRequestRepoImpl implements CaptinRequestRepo {
  final YallaNowServices yallaNowServices;

  CaptinRequestRepoImpl({required this.yallaNowServices});
  @override
  Future<Either<Failure, dynamic>> sendDriverResponse(
      {required CaptinResponseModel driverResponse}) async {
    String endPoint = 'Ride/response';
    String token = await TokenManager.getUserToken() ?? "";

    try {
      var response = await yallaNowServices.post(
        endPoint: endPoint,
        token: token,
        body: driverResponse.toJson(),
      );

      return right(response);
    } catch (e) {
      if (e is DioException) {
        log(e.response?.data);

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
  Future<Either<Failure, dynamic>> readyForTrips(
      {required ReadyModel readyModel}) async {
    String endPoint = 'Ride/ReadyForTrips';
    String token = await TokenManager.getUserToken() ?? "";
    try {
      var response = await yallaNowServices.post(
        endPoint: endPoint,
        token: token,
        body: readyModel.toJson(),
      );

      return right(response);
    } catch (e) {
      if (e is DioException) {
        log(e.response?.data.toString() ?? "error");

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
  Future<Either<Failure, dynamic>> updateDriverLocation(
      {required UpdateLocationModel updateModel}) async {
    String endPoint = 'Ride/UpdateDriverLocation';
    String token = await TokenManager.getUserToken() ?? "";
    try {
      var response = await yallaNowServices.post(
        endPoint: endPoint,
        token: token,
        body: updateModel.toJson(),
      );
      return right(response);
    } catch (e) {
      if (e is DioException) {
        log(e.response?.data.toString() ?? "error");

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
  Future<Either<Failure, dynamic>> cancelRide(
      {required CaptinCancelModel cancelModel}) async {
    String endPoint =
        'Ride/cancel?tripId=${cancelModel.tripId}&cancelationReason=${cancelModel.cancelationReason}';
    String token = await TokenManager.getUserToken() ?? "";
    try {
      var response = await yallaNowServices.post(
        endPoint: endPoint,
        token: token,
        // body: cancelModel.toJson(),
      );
      return right(response);
    } catch (e) {
      if (e is DioException) {
        log(e.response?.data.toString() ?? "cancel error");

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
