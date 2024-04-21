import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class YallaNowServices {
  final _baseUrl = 'http://yallanowtest.runasp.net/api/';

  final Dio _dio;

  YallaNowServices(this._dio);

  Future<dynamic> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }

  Future<List<dynamic>> post({required String endPoint, data}) async {
    var response = await _dio.post(
        'http://yallanowtest.runasp.net/api/Auth/RegisterNewUser',
        data: data,
        options: Options(headers: {
          'accept': '*/*',
          'Content-Type': 'application/json',
        }));
    if (response.statusCode == 200) {
      dynamic responseData = response.data;
      return responseData;
    } else {
      // Handle HTTP error status codes
      print('Dio ${response.statusCode} Error: ${response.data}');
    }
    return response.data;
  }
}

class YallaNowServicesHttp {
  // final _baseUrl = 'http://yallanowtest.runasp.net/api/';

  Future<dynamic> post({required String endPoint, dynamic data}) async {
    var response = await http.post(
      Uri.parse('http://yallanowtest.runasp.net/api/'),
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      // Handle HTTP error status codes
      print('HTTP ${response.statusCode} Error: ${response.body}');
    }
  }
}
