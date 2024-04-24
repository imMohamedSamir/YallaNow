import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/HttpFailurs.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/data/models/DrRegisterModel.dart';

abstract class DriverRegisterationRepo {
  Future<Either<FailureHttp, dynamic>> fetchRegisteration(
      {required DriverRegisterModel driverDetails});
}
