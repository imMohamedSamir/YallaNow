import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/utlis/YallaNowServices.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/data/Repo/ScooterRideRepo.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/data/models/ride_prices_model.dart';

class ScooterRideRepoImpl implements ScooterRideRepo {
  final YallaNowServices yallaNowServices;

  ScooterRideRepoImpl({required this.yallaNowServices});
  @override
  Future<Either<Failure, RidePricesModel>> getRidePrice(
      {required double distance}) async {
    String endPoint = "TripRequests/calculate-price?distance=$distance";
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
}
