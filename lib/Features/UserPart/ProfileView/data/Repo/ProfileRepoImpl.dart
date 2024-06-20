import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/utlis/TokenManger.dart';
import 'package:yallanow/Core/utlis/YallaNowServices.dart';
import 'package:yallanow/Features/UserPart/ProfileView/data/Repo/ProfileRepo.dart';
import 'package:yallanow/Features/UserPart/ProfileView/data/models/user_profile_details.dart';

class ProfileRepoImpl implements ProfileRepo {
  final YallaNowServices yallaNowServices;

  ProfileRepoImpl({required this.yallaNowServices});
  String? usertoken;
  @override
  Future<Either<Failure, UserProfileDetails>> fetchUserDetails() async {
    usertoken = await TokenManager.getUserToken();
    log(usertoken.toString());
    String endPoint = "UserProfile/User";
    try {
      var response = await yallaNowServices.get(
        endPoint: endPoint,
      );

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
