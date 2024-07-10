import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/data/models/DrRegisterModel.dart';

abstract class DriverRegisterationRepo {
  Future<Either<Failure, dynamic>> fetchRegisteration(
      {required DriverRegisterModel driverDetails});
}
