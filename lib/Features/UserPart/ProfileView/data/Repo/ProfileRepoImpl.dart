import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/YallaNowServices.dart';
import 'package:yallanow/Features/UserPart/ProfileView/data/Repo/ProfileRepo.dart';
import 'package:yallanow/Features/UserPart/ProfileView/data/models/user_profile_details.dart';

class ProfileRepoImpl implements ProfileRepo {
  final YallaNowServices yallaNowServices;

  ProfileRepoImpl({required this.yallaNowServices});
  String? usertoken;
  @override
  Future<Either<Failure, UserProfileDetails>> fetchUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    usertoken = prefs.getString(token);
    log(usertoken.toString());
    String endPoint = "UserProfile/UserProfile";
    try {
      var response =
          await yallaNowServices.get(endPoint: endPoint, token: usertoken);

      return right(UserProfileDetails.fromJson(response));
    } catch (e) {
      log("msg: ${e.toString()}");
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e.type),
        );
      }

      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
