import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/utlis/YallaNowServices.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/popular_food_category.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/resturant_branch_details/resturant_branch_details.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/top_categ_resturant.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Repo/FoodRepo.dart';

class FoodRepoImpl implements FoodRepo {
  final YallaNowServices yallaNowServices;

  FoodRepoImpl({required this.yallaNowServices});

  @override
  Future<Either<Failure, ResturantBranchDetails>> fetchResturantBranches(
      {required String restaurantId}) async {
    String endPoint = "FoodResturant/GetRestaurantDetails";

    try {
      var response = await yallaNowServices.get(
          endPoint: "$endPoint?restaurantId=$restaurantId");
      List<ResturantBranchDetails> branches = [];
      for (var branch in response) {
        branches.add(ResturantBranchDetails.fromJson(branch));
      }
      return right(branches[1]);
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
}
