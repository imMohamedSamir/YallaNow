import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/YallaNowServices.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/Repo/BasketRepo.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/basket_item_model/basket_item_model.dart';

class BasketRepoImpl implements BasketRepo {
  final YallaNowServices yallaNowServices;

  BasketRepoImpl({required this.yallaNowServices});
  @override
  Future<Either<Failure, dynamic>> fetchResturantBranches(
      {required List<BasketItemModel> items}) async {
    String endPoint = "Basket/AddList";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String usertoken = prefs.getString(savedToken) ?? '';
    log(jsonEncode(items));
    try {
      var response = await yallaNowServices.post(
          endPoint: endPoint, body: jsonEncode(items), token: usertoken);
      log(response.toString());
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
}
