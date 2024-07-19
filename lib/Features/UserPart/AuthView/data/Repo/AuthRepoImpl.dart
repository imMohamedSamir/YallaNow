import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/Errors/HttpFailurs.dart';
import 'package:yallanow/Core/utlis/YallaNowServices.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Models/CredentialModel.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Models/external_auth_model/external_auth_dto.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Models/external_auth_model/external_auth_model.dart';
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

////////////////////////////////////////With google////////////////////////////////
  @override
  Future<Either<Failure, dynamic>> signinWithGoogle() async {
    String endPoint = "Google/ExternalLogin";

    try {
      OAuthCredential credential = await _getGooglCredential();
      CredentialModel(
              idToken: credential.idToken!, provider: credential.providerId)
          .saveCredential();
      var response = await yallaNowServices.post(
          endPoint: endPoint,
          body: jsonEncode({
            "provider": credential.providerId,
            "idToken": credential.idToken
          }));
      log(response.toString());
      await CredentialModel().deleteCredential();

      return right(response);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(
            ServerFailure.fromResponse(e.response!.statusCode, e.response));
      }

      return left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, dynamic>> signiupWithGoogle(
      {required ExternalAuthModel authModel}) async {
    String endPoint = "Google/GoogleSignUp";
    try {
      CredentialModel credentialModel =
          await CredentialModel().getCredential() ?? CredentialModel();
      ExternalAuthData externalAuthData = ExternalAuthData();
      externalAuthData.idToken = credentialModel.idToken;
      externalAuthData.provider = credentialModel.provider;
      authModel.externalAuthDto = externalAuthData;

      var response = await yallaNowServices.post(
          endPoint: endPoint, body: authModel.toJson());
      log(response.toString());
      return right(response);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(
            ServerFailure.fromResponse(e.response!.statusCode, e.response));
      }

      return left(
        ServerFailure(e.toString()),
      );
    }
  }

  Future<OAuthCredential> _getGooglCredential() async {
    if (await GoogleSignIn().isSignedIn()) {
      await GoogleSignIn().signOut();
    }
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);

    return credential;
  }

////////////////////////////////////////With facebook////////////////////////////////
  @override
  Future<Either<Failure, dynamic>> signinWithFaceBook() async {
    String endPoint = "Facebook/ExternalLogin";

    try {
      OAuthCredential credential = await _getFaceBookCredential();
      CredentialModel(
              idToken: credential.accessToken!, provider: credential.providerId)
          .saveCredential();
      var response = await yallaNowServices.post(
          endPoint: endPoint,
          body: jsonEncode({
            "provider": credential.providerId,
            "idToken": credential.accessToken
          }));
      log(response.toString());
      await CredentialModel().deleteCredential();

      return right(response);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(
            ServerFailure.fromResponse(e.response!.statusCode, e.response));
      }

      return left(
        ServerFailure(e.toString()),
      );
    }
  }

  Future<OAuthCredential> _getFaceBookCredential() async {
    FacebookAuth facebookAuth = FacebookAuth.instance;
    final LoginResult loginResult = await facebookAuth.login();

    // var result = await facebookAuth.getUserData();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
    // log(facebookAuthCredential.accessToken!);
    return facebookAuthCredential;
  }

  @override
  Future<Either<Failure, dynamic>> signiupWithFaceBook(
      {required ExternalAuthModel authModel}) async {
    String endPoint = "Facebook/FacebookSignUp";
    try {
      CredentialModel credentialModel =
          await CredentialModel().getCredential() ?? CredentialModel();
      ExternalAuthData externalAuthData = ExternalAuthData();
      externalAuthData.idToken = credentialModel.idToken;
      externalAuthData.provider = credentialModel.provider;
      authModel.externalAuthDto = externalAuthData;
      log(authModel.toJson().toString());
      var response = await yallaNowServices.post(
          endPoint: endPoint, body: authModel.toJson());
      log(response.toString());
      return right(response);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(
            ServerFailure.fromResponse(e.response!.statusCode, e.response));
      }

      return left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, dynamic>> passwordResetRequest(
      {required String email}) async {
    String endPoint = "Auth/request-reset";
    try {
      var response = await yallaNowServices.post(
          endPoint: endPoint, body: jsonEncode({"email": email}));
      log(response.toString());
      return right(response);
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

  @override
  Future<Either<Failure, dynamic>> resetPassword(
      {required String email,
      required String otp,
      required String newPassword}) async {
    String endPoint = "Auth/reset-password";
    try {
      var response = await yallaNowServices.post(
          endPoint: endPoint,
          body: jsonEncode(
              {"email": email, "otp": otp, "newPassword": newPassword}));
      log(response.toString());
      return right(response);
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

  @override
  Future<Either<Failure, dynamic>> verifyOTP(
      {required String email, required String otp}) async {
    String endPoint = "Auth/verify-otp";
    try {
      var response = await yallaNowServices.post(
          endPoint: endPoint, body: jsonEncode({"email": email, "otp": otp}));
      log(response.toString());
      return right(response);
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
