import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/utlis/TokenManger.dart';
import 'package:yallanow/Core/utlis/YallaNowServices.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/Repo/BasketRepo.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/basket_item_model/basket_item_model.dart';

class BasketRepoImpl implements BasketRepo {
  final YallaNowServices yallaNowServices;

  BasketRepoImpl({required this.yallaNowServices});
  String usertoken = '';
  @override
  Future<Either<Failure, dynamic>> fetchResturantBranches(
      {required List<BasketItemModel> items}) async {
    String endPoint = "Basket/AddList";

    usertoken = await TokenManager.getUserToken() ?? "";
    log(jsonEncode(items));
    try {
      var response = await yallaNowServices.post(
          endPoint: endPoint, body: jsonEncode(items), token: usertoken);
      log(response.toString());
      return right(response);
    } catch (e) {
      if (e is DioException) {
        log(e.message.toString());

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
