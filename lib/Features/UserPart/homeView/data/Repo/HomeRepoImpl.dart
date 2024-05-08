import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/utlis/YallaNowServices.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/resturant_branch_model.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/popular_resturants.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Repo/HomeRepo.dart';

class HomeRepoImpl implements HomeRepo {
  final YallaNowServices yallaNowServices;

  HomeRepoImpl({required this.yallaNowServices});
  @override
  Future<Either<Failure, List<PopularResturants>>>
      fetchPopularResturant() async {
    String endpoint1 = "FoodHome/ExploreRestaurants?page=1&pageSize=5";
    String endPoint = "FoodHome/PopularResturants";
    try {
      var response = await yallaNowServices.get(endPoint: endpoint1);
      List<PopularResturants> resturants = [];
      for (var resturant in response) {
        resturants.add(PopularResturants.fromJson(resturant));
      }
      return right(resturants);
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

  // Future<Either<Failure, List<ResturantBranchModel>>> fetchResturantBranches(
  //     {required String resturantID}) async {
  //   String endPoint = "FoodResturant/GetBranches?restaurantId=$resturantID";
  //   try {
  //     var response = await yallaNowServices.get(endPoint: endPoint);
  //     List<ResturantBranchModel> branches = [];
  //     for (var branch in response) {
  //       branches.add(ResturantBranchModel.fromJson(branch));
  //     }
  //     print(branches[0].id);
  //     return right(branches);
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(
  //         ServerFailure.fromDioError(e.type),
  //       );
  //     }

  //     return left(
  //       ServerFailure(
  //         e.toString(),
  //       ),
  //     );
  //   }
  // }
}
