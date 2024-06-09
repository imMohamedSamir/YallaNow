import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/YallaNowServices.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/data/Models/place_order_model.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/data/Repo/CheckoutRepo.dart';

class CheckoutRepoImpl implements CheckOutRepo {
  final YallaNowServices yallaNowServices;

  CheckoutRepoImpl({required this.yallaNowServices});
  @override
  Future<Either<Failure, dynamic>> fetchPlaceOrder(
      {required PlaceOrderModel orderDetails}) async {
    String endPoint = "Basket/PlaceOrder";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String usertoken = prefs.getString(savedToken) ?? '';
    log('orderDetails:\n${jsonEncode(orderDetails)} ');
    try {
      var response = await yallaNowServices.post(
          endPoint: endPoint, body: jsonEncode(orderDetails), token: usertoken);
      log(response.toString());
      return right(response);
    } catch (e) {
      // log(e.toString());
      if (e is DioException) {
        // log(e.toString());
        final statusCode = e.response?.statusCode;
        final response = e.response?.data;

        return left(
          ServerFailure.fromResponse(statusCode, response),
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
