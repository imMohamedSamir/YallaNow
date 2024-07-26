import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/translate_respons_model/translate_respons_model.dart';

class GoogleMapsServices {
  final _baseUrl = 'https://maps.googleapis.com/maps/api/';

  final Dio _dio;

  GoogleMapsServices(this._dio);

  Future<Map<String, dynamic>> getPreditction(
      {required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }

  Future<Either<Failure, TranslateResponsModel>> translate(
      {required String text}) async {
    var body = json.encode({
      'q': text,
      'target': "ar",
      'source': "en",
      'format': 'text',
    });
    String endPoint =
        "https://translation.googleapis.com/language/translate/v2?key=$googleApiKey";
    try {
      var response = await _dio.post(
        endPoint,
        options: Options(
            headers: {'Content-Type': 'application/json', 'Accept': '*/*'}),
        data: body,
      );
      TranslateResponsModel result =
          TranslateResponsModel.fromJson(response.data!);
      return right(result);
    } on Exception catch (e) {
      log(e.toString());
      if (e is DioException) {
        log(e.response.toString());

        return left(ServerFailure.fromDioError(e.type));
      }

      return left(
        ServerFailure(e.toString()),
      );
    }
  }
}
