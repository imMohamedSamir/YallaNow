import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/place_autocomplete_model/place_autocomplete_model.dart';

abstract class AddressesRepo {
  Future<Either<Failure, List<PlaceModel>>> getPredictions(
      {required String input});
}
