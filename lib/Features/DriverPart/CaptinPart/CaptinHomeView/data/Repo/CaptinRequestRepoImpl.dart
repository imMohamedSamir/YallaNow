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
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinOrdersView/data/models/driver_trips_model/CaptinTripsModel.dart';

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
      log(e.toString());
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
      {required CancelModel cancelModel}) async {
    String endPoint =
        'Ride/cancel?tripId=${cancelModel.tripId}&cancelationReason=${cancelModel.cancelationReason}&IsUser=${cancelModel.isUser}';
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

  @override
  Future<Either<Failure, CaptinTripsModel>> captinTrips() async {
    String endPoint = 'Driver/RiderTrips';
    String token = await TokenManager.getUserToken() ?? "";
    try {
      var response =
          await yallaNowServices.get(endPoint: endPoint, token: token);

      return right(CaptinTripsModel.fromJson(response));
    } catch (e) {
      log(e.toString());

      if (e is DioException) {
        log(e.response?.data.toString() ?? e.toString());
        return left(
          ServerFailure.fromDioError(e.type),
        );
      }

      return left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, dynamic>> startTrip({required String tripId}) async {
    String endPoint = 'Ride/start?tripId=$tripId';
    String token = await TokenManager.getUserToken() ?? "";
    try {
      var response = await yallaNowServices.post(
        endPoint: endPoint,
        token: token,
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
  Future<Either<Failure, dynamic>> endTrip({required String tripId}) async {
    String endPoint = 'Ride/end?tripId=$tripId';
    String token = await TokenManager.getUserToken() ?? "";
    try {
      var response = await yallaNowServices.post(
        endPoint: endPoint,
        token: token,
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
  Future<Either<Failure, dynamic>> disconnect() async {
    String endPoint = 'Ride/Disconnect';
    String token = await TokenManager.getUserToken() ?? "";
    try {
      var response =
          await yallaNowServices.post(endPoint: endPoint, token: token);
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
  Future<Either<Failure, dynamic>> addToWallet(
      {required String userId, required double value}) async {
    String endPoint = 'Wallets/add-value';
    String token = await TokenManager.getUserToken() ?? "";
    try {
      var response = await yallaNowServices.post(
        endPoint: endPoint,
        token: token,
        body: {
          'userId': userId,
          'value': value,
        },
      );
      return right(response);
    } catch (e) {
      if (e is DioException) {
        log(e.response?.data.toString() ?? "error");

        return left(
          ServerFailure.fromResponse(e.response!.statusCode, e.response!),
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
