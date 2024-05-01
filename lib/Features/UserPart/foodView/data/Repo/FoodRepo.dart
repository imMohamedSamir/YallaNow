import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/popular_food_category.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/resturant_branch_details/resturant_branch_details.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/top_categ_resturant.dart';

abstract class FoodRepo {
  Future<Either<Failure, ResturantBranchDetails>> fetchResturantBranches(
      {required String restaurantId});
  Future<Either<Failure, List<PopularFoodCategory>>> fetchPopularCategory();
  Future<Either<Failure, List<TopCategResturant>>> fetchPopularCategoryPage(
      {required String categoryId});
}
