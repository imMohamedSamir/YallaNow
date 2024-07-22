import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/data/models/captin_details_model.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/data/models/captin_drawer_details_model.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/data/models/vehicel_detaisl_model.dart';

abstract class CatpinProfileRepo {
  Future<Either<Failure, CaptinDrawerDetailsModel>> captinDrawer();
  Future<Either<Failure, Uint8List>> captinPapers();
  Future<Either<Failure, CaptinDetailsModel>> captinDetails();
  Future<Either<Failure, VehicleDetaislModel>> vehicleDetails();
}
