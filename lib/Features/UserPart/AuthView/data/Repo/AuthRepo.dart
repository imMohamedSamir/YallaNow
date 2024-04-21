import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/HttpFailurs.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Models/login_response_model.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Models/register_model.dart';

abstract class AuthRepo {
  Future<Either<FailureHttp, dynamic>> fetchRegisteration(
      {required RegisterModel userdata});
  Future<Either<FailureHttp, LoginResponseModel>> fetchLogin(
      {required String email, required String password});
}
