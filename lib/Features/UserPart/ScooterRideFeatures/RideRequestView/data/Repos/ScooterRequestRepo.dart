import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/models/ride_rating_model.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/models/user_request_model.dart';

abstract class ScooterRequestRepo {
  Future<Either<Failure, dynamic>> sendRequest(
      {required UserRequestModel request});
  Future<Either<Failure, dynamic>> tripRating(
      {required RideRatingModel rating});
  Future<Either<Failure, dynamic>> applyPromoCode(
      {required String userId, required String promoCode});
  Future<Either<Failure, dynamic>> cancelPromoCode(
      {required String userId, required String promoCode});
  Future<Either<Failure, dynamic>> checkbalance({required double value});
}
