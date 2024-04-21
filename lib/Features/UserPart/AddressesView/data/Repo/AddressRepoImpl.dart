import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/utlis/Google_Api_services.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/Repo/AddressRepo.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/place_autocomplete_model/place_autocomplete_model.dart';

class AddressesRepoImpl implements AddressesRepo {
  final GoogleMapsServices googleMapsServices;

  final String placesApiKey = 'AIzaSyCxHMBWhEn5YR3V9MeqLOUg8_wYha4r820';
  AddressesRepoImpl(this.googleMapsServices);

  @override
  Future<Either<Failure, List<PlaceModel>>> getPredictions(
      {required String input}) async {
    String endPoint = 'autocomplete/json?key=$placesApiKey&input=$input';

    try {
      var data = await googleMapsServices.get(endPoint: endPoint);
      var predictions = data['predictions'];
      List<PlaceModel> places = [];
      for (var item in predictions) {
        places.add(PlaceModel.fromJson(item));
      }
      return right(places);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e.type),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
