import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/TokenManger.dart';
import 'package:yallanow/Core/utlis/functions/DialogMethode.dart';
import 'package:yallanow/main.dart';

class YallaNowServices {
  String _baseUrl = 'https://yallanow.runasp.net/api/';

  final Dio _dio;

  YallaNowServices(this._dio) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await _getToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options); // Continue
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          // final newToken = await _refreshToken();
          await TokenManager.getUserRole().then((role) {
            if (role == "Driver") {
              captinSessionExpMethode(navigatorKey.currentContext!);
            } else {
              sessionExpMethode(navigatorKey.currentContext!);
            }
          });

          // if (newToken != null) {
          //   // Update token in headers and retry the request
          //   e.requestOptions.headers['Authorization'] = 'Bearer $newToken';
          //   final opts = Options(
          //     method: e.requestOptions.method,
          //     headers: e.requestOptions.headers,
          //   );
          //   final cloneReq = await _dio.request(
          //     e.requestOptions.path,
          //     options: opts,
          //     data: e.requestOptions.data,
          //     queryParameters: e.requestOptions.queryParameters,
          //   );
          //   return handler.resolve(cloneReq); // Return the new response
          // }
        }
        return handler
            .next(e); // Continue with the error if token refresh fails
      },
    ));
  }
  Future<String?> _getToken() async {
    return await TokenManager.getUserToken();
  }

  Future<void> _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(savedToken, token);
  }

  Future<String?> _refreshToken() async {
    try {
      final curretToken = await _getToken();
      final response = await _dio.get(
          'https://yallanow.runasp.net/api/Auth/refreshToken',
          options: Options(headers: {
            'accept': '*/*',
            'Authorization': 'Bearer $curretToken'
          }));
      if (response.statusCode == 200) {
        final newToken = response.data['token'];
        await _saveToken(newToken);
        return newToken;
      }
    } catch (e) {
      log("$e there is no token");
      // Handle error (e.g., log out the user)
    }
    log(" there is no token");
    return null;
  }

  Future<dynamic> get(
      {required String endPoint, String? token, bool isMart = false}) async {
    if (isMart) {
      _baseUrl = "https://yallanow.runasp.net/";
    } else {
      _baseUrl = 'https://yallanow.runasp.net/api/';
    }
    var response = await _dio.get('$_baseUrl$endPoint',
        options: Options(headers: {
          'accept': '*/*',
          'Authorization': token == null ? null : 'Bearer $token'
        }));
    return response.data;
  }

  Future<dynamic> post({required String endPoint, body, String? token}) async {
    var response = await _dio.post('$_baseUrl$endPoint',
        data: body,
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
    }
    return response.data;
  }

  Future<dynamic> put({required String endPoint, body, String? token}) async {
    var response = await _dio.put('$_baseUrl$endPoint',
        data: body,
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
      Uri.parse('https://yallanowtest.runasp.net/api/'),
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
      Uri.parse('https://yallanowtest.runasp.net/api/'),
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
