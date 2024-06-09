import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/models/pharmacy_details_model/pharmacy_details_model.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/models/pharmacy_model.dart';

abstract class PharmacyRepo {
  Future<Either<Failure, List<PharmacyModel>>> fetchPharmacies();
  Future<Either<Failure, List<PharmacyDetailsModel>>> fetchPharmaciesDetails(
      {required String pharmacyId});
}
