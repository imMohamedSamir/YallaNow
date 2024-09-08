import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/utlis/Keys.dart';
import 'package:yallanow/Features/UserPart/ProfileView/data/Repo/ProfileRepo.dart';

class BillingData {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String apartment;
  final String floor;
  final String street;
  final String building;
  final String shippingMethod;
  final String postalCode;
  final String city;
  final String country;
  final String state;

  BillingData({
    this.firstName = "ali",
    this.lastName = "lolo",
    this.email = "ali3502@gmail.com",
    this.phoneNumber = "01127523369",
    this.apartment = "NA",
    this.floor = "NA",
    this.street = "NA",
    this.building = "NA",
    this.shippingMethod = "NA",
    this.postalCode = "NA",
    this.city = "NA",
    this.country = "NA",
    this.state = "NA",
  });

  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "phone_number": phoneNumber,
      "apartment": apartment,
      "floor": floor,
      "street": street,
      "building": building,
      "shipping_method": shippingMethod,
      "postal_code": postalCode,
      "city": city,
      "country": country,
      "state": state,
    };
  }
}

class PaymobManager {
  final ProfileRepo _profileRepo;

  PaymobManager({required ProfileRepo profileRepo})
      : _profileRepo = profileRepo;
  Future<Either<Failure, String>> getPaymentKey({
    required double amount,
    String currency = "EGP",
  }) async {
    try {
      String authanticationToken = await _getAuthanticationToken();

      int orderId = await _getOrderId(
        authanticationToken: authanticationToken,
        amount: (100 * amount).toString(),
        currency: currency,
      );

      String paymentKey = await _getPaymentKey(
        authanticationToken: authanticationToken,
        orderId: orderId.toString(),
        amount: (100 * amount).toString(),
        currency: currency,
      );
      return right(paymentKey);
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
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

  Future<String> _getAuthanticationToken() async {
    final Response response =
        await Dio().post("https://accept.paymob.com/api/auth/tokens", data: {
      "api_key": kPaymobApiKey,
    });
    return response.data["token"];
  }

  Future<int> _getOrderId({
    required String authanticationToken,
    required String amount,
    required String currency,
  }) async {
    final Response response = await Dio()
        .post("https://accept.paymob.com/api/ecommerce/orders", data: {
      "auth_token": authanticationToken,
      "amount_cents": amount, //  >>(STRING)<<
      "currency": currency, //Not Req
      "delivery_needed": "false",
      "items": [],
    });
    return response.data["id"]; //INTGER
  }

  Future<String> _getPaymentKey({
    required String authanticationToken,
    required String orderId,
    required String amount,
    required String currency,
  }) async {
    BillingData billingData = await _getUserData() ?? BillingData();
    final Response response = await Dio()
        .post("https://accept.paymob.com/api/acceptance/payment_keys", data: {
      //ALL OF THEM ARE REQIERD
      "expiration": 3600,

      "auth_token": authanticationToken, //From First Api
      "order_id": orderId, //From Second Api  >>(STRING)<<
      "integration_id": cardPaymentMethodIntegrationId,

      "amount_cents": amount,
      "currency": currency,

      "billing_data": billingData.toJson(),
    });
    return response.data["token"];
  }

  Future<BillingData?> _getUserData() async {
    late BillingData billingData;
    var result = await _profileRepo.fetchUserDetails();

    result.fold((fail) {
      return BillingData();
    }, (data) {
      billingData = BillingData(
          firstName: data.firstName ?? "test",
          lastName: data.lastName ?? "test",
          email: data.email ?? "test",
          phoneNumber: data.phoneNumber);
    });
    return billingData;
  }
}
