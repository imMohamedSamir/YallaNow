import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/HttpFailurs.dart';
import 'package:yallanow/Core/utlis/YallaNowServices.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Models/login_response_model.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Models/register_model.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Repo/AuthRepo.dart';
import 'package:http/http.dart' as http;

class AuthRepoImpl implements AuthRepo {
  final YallaNowServicesHttp yallaNowServicesHttp;
  AuthRepoImpl({
    required this.yallaNowServicesHttp,
  });
  @override
  Future<Either<FailureHttp, dynamic>> fetchRegisteration(
      {required UserRegisterModel userdata}) async {
    try {
      var response = await http.post(
        Uri.parse('http://yallanowtest.runasp.net/api/Auth/RegisterNewUser'),
        headers: {
          'accept': '*/*',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(userdata),
      );
      if (response.statusCode == 200) {
        return right(response.body);
      } else {
        return left(ServerFailureHttp.fromHttpError(response));
      }
    } on Exception catch (e) {
      return left(
        ServerFailureHttp(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<FailureHttp, LoginResponseModel>> fetchLogin(
      {required String email, required String password}) async {
    // String endPoint = "Auth/token";
    String url = "http://yallanowtest.runasp.net/api/Auth/token";
    try {
      var response = await http.post(Uri.parse(url),
          headers: {
            'accept': '*/*',
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            "email": email,
            "password": password,
          }));
      if (response.statusCode == 200) {
        log(jsonDecode(response.body).toString());
        return right(LoginResponseModel.fromJson(jsonDecode(response.body)));
      } else {
        return left(ServerFailureHttp.fromHttpError(response));
      }
    } on Exception catch (e) {
      throw left(e.toString());
    }
  }
}
