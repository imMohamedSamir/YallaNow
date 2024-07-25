import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/CaptinCancelModel.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/CaptinResponseModel.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/ready_model.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/update_location_model.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinOrdersView/data/models/driver_trips_model/CaptinTripsModel.dart';

abstract class CaptinRequestRepo {
  Future<Either<Failure, dynamic>> sendDriverResponse(
      {required CaptinResponseModel driverResponse});
  Future<Either<Failure, dynamic>> readyForTrips(
      {required ReadyModel readyModel});
  Future<Either<Failure, dynamic>> updateDriverLocation(
      {required UpdateLocationModel updateModel});
  Future<Either<Failure, dynamic>> cancelRide(
      {required CancelModel cancelModel});
  Future<Either<Failure, CaptinTripsModel>> captinTrips();
  Future<Either<Failure, dynamic>> startTrip({required String tripId});
  Future<Either<Failure, dynamic>> endTrip({required String tripId});
  Future<Either<Failure, dynamic>> disconnect();
  Future<Either<Failure, dynamic>> addToWallet(
      {required String userId, required double value});
}
