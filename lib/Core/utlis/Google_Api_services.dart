import 'package:dio/dio.dart';

class GoogleMapsServices {
  final _baseUrl = 'https://maps.googleapis.com/maps/api/place/';

  final Dio _dio;

  GoogleMapsServices(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
