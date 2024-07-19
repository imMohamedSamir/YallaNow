import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/Errors/HttpFailurs.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Models/external_auth_model/external_auth_model.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Models/login_response_model.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Models/register_model.dart';

abstract class AuthRepo {
  Future<Either<FailureHttp, dynamic>> fetchRegisteration(
      {required UserRegisterModel userdata});
  Future<Either<Failure, LoginResponseModel>> fetchLogin(
      {required String email, required String password});
  Future<Either<Failure, dynamic>> signinWithGoogle();
  Future<Either<Failure, dynamic>> signiupWithGoogle(
      {required ExternalAuthModel authModel});
  Future<Either<Failure, dynamic>> signinWithFaceBook();
  Future<Either<Failure, dynamic>> signiupWithFaceBook(
      {required ExternalAuthModel authModel});
  Future<Either<Failure, dynamic>> passwordResetRequest(
      {required String email});
  Future<Either<Failure, dynamic>> verifyOTP(
      {required String email, required String otp});
  Future<Either<Failure, dynamic>> resetPassword(
      {required String email,
      required String otp,
      required String newPassword});
}
