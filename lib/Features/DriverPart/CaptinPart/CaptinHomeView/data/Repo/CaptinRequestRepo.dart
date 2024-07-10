import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/CaptinCancelModel.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/CaptinResponseModel.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/ready_model.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/update_location_model.dart';

abstract class CaptinRequestRepo {
  Future<Either<Failure, dynamic>> sendDriverResponse(
      {required CaptinResponseModel driverResponse});
  Future<Either<Failure, dynamic>> readyForTrips(
      {required ReadyModel readyModel});
  Future<Either<Failure, dynamic>> updateDriverLocation(
      {required UpdateLocationModel updateModel});
  Future<Either<Failure, dynamic>> cancelRide(
      {required CaptinCancelModel cancelModel});
}
