import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/login_cubit/login_cubit.dart';

abstract class TokenManager {
  static Future<void> saveUserToken(
      {required SavedUserDetails userDetails}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    log(userDetails.role);
    await prefs.setString(savedToken, userDetails.token);
    await prefs.setString(savedRole, userDetails.role);
  }

  static Future<String?> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(savedToken);
  }

  static void removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(savedToken);
    await prefs.remove(savedRole);
  }
}
