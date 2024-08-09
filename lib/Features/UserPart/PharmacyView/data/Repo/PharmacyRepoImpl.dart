import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/utlis/YallaNowServices.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/Repo/PharmacyRepo.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/models/pharmacy_details_model/pharmacy_details_model.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/models/pharmacy_model.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/search_result_model.dart';

class PharmacyRepoImpl implements PharmacyRepo {
  final YallaNowServices yallaNowServices;

  PharmacyRepoImpl({required this.yallaNowServices});
  @override
  Future<Either<Failure, List<PharmacyModel>>> fetchPharmacies() async {
    String endPoint = "PharmacyHome/GetAllPharmacies";

    try {
      var response =
          await yallaNowServices.get(endPoint: endPoint, isMart: false);
      List<PharmacyModel> pharmacies = [];
      for (var pharmacy in response) {
        pharmacies.add(PharmacyModel.fromJson(pharmacy));
      }
      return right(pharmacies);
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
  Future<Either<Failure, List<PharmacyDetailsModel>>> fetchPharmaciesDetails(
      {required String pharmacyId}) async {
    String endPoint = "PharmacyHome/pharmacyCategory?pharmacyid=$pharmacyId";

    try {
      var response =
          await yallaNowServices.get(endPoint: endPoint, isMart: false);
      List<PharmacyDetailsModel> pharmacies = [];
      for (var pharmacy in response) {
        pharmacies.add(PharmacyDetailsModel.fromJson(pharmacy));
      }
      return right(pharmacies);
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
  Future<Either<Failure, List<SearchResultModel>>> pharmacySearch(
      {required String input}) async {
    String endPoint = "FoodHome/search?query=$input";
    try {
      var response = await yallaNowServices.get(endPoint: endPoint);
      List<SearchResultModel> results = [];
      for (var result in response) {
        results.add(SearchResultModel.fromJson(result));
      }
      return right(results);
    } catch (e) {
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
