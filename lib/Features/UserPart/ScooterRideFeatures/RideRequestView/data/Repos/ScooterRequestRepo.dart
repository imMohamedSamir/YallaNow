import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/models/user_request_model.dart';

abstract class ScooterRequestRepo {
  Future<Either<Failure, dynamic>> sendRequest(
      {required UserRequestModel request});
}
