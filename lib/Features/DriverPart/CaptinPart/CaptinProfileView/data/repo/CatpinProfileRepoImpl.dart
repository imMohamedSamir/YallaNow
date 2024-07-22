import 'dart:developer';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/utlis/TokenManger.dart';
import 'package:yallanow/Core/utlis/YallaNowServices.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/data/models/captin_details_model.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/data/models/captin_drawer_details_model.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/data/models/vehicel_detaisl_model.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/data/repo/CatpinProfileRepo.dart';

class CatpinProfileRepoImpl implements CatpinProfileRepo {
  final YallaNowServices yallaNowServices;

  CatpinProfileRepoImpl({required this.yallaNowServices});
  final dio = Dio();

  @override
  Future<Either<Failure, CaptinDetailsModel>> captinDetails() async {
    String endPoint = 'Driver/RiderDetails';
    String token = await TokenManager.getUserToken() ?? "";
    try {
      var response =
          await yallaNowServices.get(endPoint: endPoint, token: token);
      log(response.toString());
      return right(CaptinDetailsModel.fromJson(response));
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
  Future<Either<Failure, CaptinDrawerDetailsModel>> captinDrawer() async {
    String endPoint = 'Driver/drawerDetails';
    String token = await TokenManager.getUserToken() ?? "";
    try {
      var response =
          await yallaNowServices.get(endPoint: endPoint, token: token);
      return right(CaptinDrawerDetailsModel.fromJson(response));
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
  Future<Either<Failure, Uint8List>> captinPapers() async {
    String endPoint = 'Driver/DriverPapers';
    String token = await TokenManager.getUserToken() ?? "";
    try {
      var response =
          await yallaNowServices.get(endPoint: endPoint, token: token);
      log(response.toString());
      final result = await dio.get(response,
          options: Options(responseType: ResponseType.bytes));

      return right(result.data);
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
  Future<Either<Failure, VehicleDetaislModel>> vehicleDetails() async {
    String endPoint = 'Driver/VechileDetails';
    String token = await TokenManager.getUserToken() ?? "";
    try {
      var response =
          await yallaNowServices.get(endPoint: endPoint, token: token);
      return right(VehicleDetaislModel.fromJson(response));
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
}
