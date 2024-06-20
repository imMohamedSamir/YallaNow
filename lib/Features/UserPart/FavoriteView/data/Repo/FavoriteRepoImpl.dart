import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/utlis/TokenManger.dart';
import 'package:yallanow/Core/utlis/YallaNowServices.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/data/Repo/FavoriteRepo.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/data/models/add_fav_model.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/data/models/fav_details_model/fav_details_model.dart';

class FavoriteRepoImpl implements FavoriteRepo {
  final YallaNowServices yallaNowServices;
  FavoriteRepoImpl({required this.yallaNowServices});
  String? userToken;

  @override
  Future<Either<Failure, dynamic>> addToFavorits(
      {required AddFavModel favModel}) async {
    String endPoint = "UserFavorites/add";
    userToken = await TokenManager.getUserToken();
    try {
      var response = await yallaNowServices.post(
          endPoint: endPoint, body: favModel.toJson(), token: userToken);

      return right(response);
    } catch (e) {
      log(e.toString());
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

  @override
  Future<Either<Failure, dynamic>> removeFav({required String favId}) async {
    String endPoint = "UserFavorites/Remove?favoriteId=$favId";
    userToken = await TokenManager.getUserToken();
    try {
      var response =
          await yallaNowServices.get(endPoint: endPoint, token: userToken);

      return right(response);
    } catch (e) {
      log(e.toString());
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

  @override
  Future<Either<Failure, FavDetailsModel>> getFav() async {
    String endPoint = "UserFavorites/UserFavourite";
    userToken = await TokenManager.getUserToken();
    try {
      var response =
          await yallaNowServices.get(endPoint: endPoint, token: userToken);

      return right(FavDetailsModel.fromJson(response));
    } catch (e) {
      log(e.toString());
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
