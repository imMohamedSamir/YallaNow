import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Features/UserPart/RidesHistoryView/data/models/UserRideHistoryModel.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/data/models/ride_prices_model.dart';

abstract class ScooterRideRepo {
  Future<Either<Failure, RidePricesModel>> getRidePrice(
      {required double distance});
  Future<Either<Failure, List<UserRideHistoryModel>>> getRideHistory();
}
