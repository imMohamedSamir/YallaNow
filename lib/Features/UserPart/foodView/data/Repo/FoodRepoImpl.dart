import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/utlis/YallaNowServices.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/resturant_branch_details/resturant_branch_details.dart';
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
      log(branches[1].branchName.toString());
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
}
