import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class YallaNowServices {
  String _baseUrl = 'http://yallanow.runasp.net/api/';

  final Dio _dio;

  YallaNowServices(this._dio);

  Future<dynamic> get(
      {required String endPoint, String? token, bool isMart = false}) async {
    if (isMart) {
      _baseUrl = "http://yallanow.runasp.net/";
    }
    var response = await _dio.get('$_baseUrl$endPoint',
        options: Options(headers: {
          'accept': '*/*',
          'Authorization': token == null ? null : 'Bearer $token'
        }));
    return response.data;
  }

  Future<dynamic> post({required String endPoint, data, String? token}) async {
    var response = await _dio.post('$_baseUrl$endPoint',
        data: data,
        options: Options(headers: {
          'accept': '*/*',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
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

  Future<dynamic> delete({required String endPoint, String? token}) async {
    var response = await _dio.delete('$_baseUrl$endPoint',
        options: token == null
            ? null
            : Options(
                headers: {'accept': '*/*', 'Authorization': 'Bearer $token'}));
    log("${response.data.runtimeType}");
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
      log('HTTP ${response.statusCode} Error: ${response.body}');
    }
  }

  Future<http.Response> get({required String endPoint, String? token}) async {
    var response = await http.get(
      Uri.parse('http://yallanowtest.runasp.net/api/'),
      headers: {'accept': '*/*', 'Authorization': "Bearer $token"},
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      // Handle HTTP error status codes
      log('HTTP ${response.statusCode} Error: ${response.body}');
      return response;
    }
  }
}
