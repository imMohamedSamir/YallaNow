import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/utlis/TokenManger.dart';
import 'package:yallanow/Core/utlis/YallaNowServices.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryHomeView/data/Repo/DeliveryRequestRepo.dart';

class DeliveryRequestRepoImpl implements DeliveryRequestRepo {
  final YallaNowServices _yallaNowServices;

  DeliveryRequestRepoImpl(this._yallaNowServices);

  @override
  Future<Either<Failure, dynamic>> disconnect() async {
    String endPoint = 'Ride/Disconnect';
    String token = await TokenManager.getUserToken() ?? "";
    try {
      var response =
          await _yallaNowServices.post(endPoint: endPoint, token: token);
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
}
