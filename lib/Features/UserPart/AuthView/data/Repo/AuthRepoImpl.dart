import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/Errors/HttpFailurs.dart';
import 'package:yallanow/Core/utlis/YallaNowServices.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Models/login_response_model.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Models/register_model.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Repo/AuthRepo.dart';
import 'package:http/http.dart' as http;

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({required this.yallaNowServices});
  final YallaNowServices yallaNowServices;
  @override
  Future<Either<FailureHttp, dynamic>> fetchRegisteration(
      {required UserRegisterModel userdata}) async {
    try {
      var response = await http.post(
        Uri.parse('https://yallanow.runasp.net/api/Auth/RegisterNewUser'),
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
  Future<Either<Failure, LoginResponseModel>> fetchLogin(
      {required String email, required String password}) async {
    String endPoint = "Auth/token";
    try {
      var response = await yallaNowServices.post(
          endPoint: endPoint,
          body: jsonEncode({"email": email, "password": password}));

      return right(LoginResponseModel.fromJson(response));
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        log(e.response?.statusCode.toString() ?? "");

        return left(
            ServerFailure.fromResponse(e.response!.statusCode, e.response));
      }

      return left(
        ServerFailure(e.toString()),
      );
    }
  }
}
