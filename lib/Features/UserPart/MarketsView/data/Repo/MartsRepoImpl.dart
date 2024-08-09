import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/utlis/YallaNowServices.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/Repo/MartsRepo.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/mart_details_model/item.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/mart_details_model/mart_details_model.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/marts_model.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/search_result_model.dart';

class MartsRepoImpl implements MartsRepo {
  final YallaNowServices yallaNowServices;

  MartsRepoImpl({required this.yallaNowServices});

  @override
  Future<Either<Failure, List<MartsModel>>> fetchMarts() async {
    String endPoint = "GetAllMarts";

    try {
      var response =
          await yallaNowServices.get(endPoint: endPoint, isMart: true);
      List<MartsModel> marts = [];
      for (var mart in response) {
        marts.add(MartsModel.fromJson(mart));
      }
      return right(marts);
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
  Future<Either<Failure, List<MartDetailsModel>>> fetchMartsDetails(
      {required String martID}) async {
    String endPoint = "MartsCategories?martId=$martID";

    try {
      var response =
          await yallaNowServices.get(endPoint: endPoint, isMart: true);
      List<MartDetailsModel> martsDetails = [];
      for (var mart in response) {
        martsDetails.add(MartDetailsModel.fromJson(mart));
      }
      return right(martsDetails);
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
  Future<Either<Failure, List<MartItem>>> fetchMartsItems() async {
    String endPoint = "MartItems";

    try {
      var response =
          await yallaNowServices.get(endPoint: endPoint, isMart: true);
      List<MartItem> items = [];
      for (var item in response) {
        items.add(MartItem.fromJson(item));
      }
      return right(items);
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
  Future<Either<Failure, List<SearchResultModel>>> martsSearch(
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
