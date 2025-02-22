import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/utlis/YallaNowServices.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/popular_food_category.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/restrunt_details/restrunt_details.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/top_categ_resturant.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Repo/FoodRepo.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/search_result_model.dart';

class FoodRepoImpl implements FoodRepo {
  final YallaNowServices yallaNowServices;

  FoodRepoImpl({required this.yallaNowServices});

  @override
  Future<Either<Failure, RestruntDetails>> fetchResturantDetails(
      {required String restaurantId}) async {
    String endPoint = "FoodResturant/GetRestaurantDetails";

    try {
      var response = await yallaNowServices.get(
          endPoint: "$endPoint?restaurantId=$restaurantId");

      return right(RestruntDetails.fromJson(response));
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
  Future<Either<Failure, List<PopularFoodCategory>>>
      fetchPopularCategory() async {
    String endPoint = "FoodHome/PopularCategory";

    try {
      var response = await yallaNowServices.get(endPoint: endPoint);
      List<PopularFoodCategory> popularCategories = [];
      for (var category in response) {
        popularCategories.add(PopularFoodCategory.fromJson(category));
      }
      return right(popularCategories);
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
  Future<Either<Failure, List<TopCategResturant>>> fetchPopularCategoryPage(
      {required String categoryId}) async {
    String endPoint = "FoodHome/byCategory?CategoryId=$categoryId";

    try {
      var response = await yallaNowServices.get(endPoint: endPoint);
      List<TopCategResturant> resturants = [];
      for (var resturant in response) {
        resturants.add(TopCategResturant.fromJson(resturant));
      }
      return right(resturants);
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
  Future<Either<Failure, List<SearchResultModel>>> fetchSearch(
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

  @override
  Future<Either<Failure, List<TopCategResturant>>>
      fetchExploreResturant() async {
    String endPoint = "FoodHome/ExploreRestaurants?page=1&pageSize=5";

    try {
      var response = await yallaNowServices.get(endPoint: endPoint);
      List<TopCategResturant> popularCategories = [];
      for (var category in response) {
        popularCategories.add(TopCategResturant.fromJson(category));
      }
      return right(popularCategories);
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
