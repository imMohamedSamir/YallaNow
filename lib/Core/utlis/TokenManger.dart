import 'dart:developer';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/login_cubit/login_cubit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class TokenManager {
  static const _storage = FlutterSecureStorage();
  static Future<void> saveUserToken(
      {required SavedUserDetails userDetails}) async {
    await _storage.write(key: savedToken, value: userDetails.token);
    await _storage.write(key: savedRole, value: userDetails.role);
  }

  static Future<String?> getUserToken() async {
    return await _storage.read(key: savedToken);
  }

  static Future<String?> getUserRole() async {
    try {
      return await _storage.read(key: savedRole);
    } on Exception catch (e) {
      return "";
    }
  }

  static Future<String> getUserName() async {
    String? token = await _storage.read(key: savedToken);
    if (!tokenIsExp(token)) {
      return JwtDecoder.decode(token!)["sub"];
    } else {
      return "";
    }
  }

  static Future<String> getUserId() async {
    String? token = await _storage.read(key: savedToken);
    if (!tokenIsExp(token)) {
      return JwtDecoder.decode(token!)["uid"];
    } else {
      return "";
    }
  }

  static Future<void> removeToken() async {
    await _storage.delete(key: savedToken);
    await _storage.delete(key: savedRole);
  }

  static bool tokenIsExp(String? userToken) {
    if (userToken == null || userToken.isEmpty) {
      log(userToken == null ? "token is null" : "token is empty");
      return false;
    }

    final isExpired = JwtDecoder.isExpired(userToken);
    if (isExpired) {
      log("expired token");
    }

    return isExpired;
  }
}
