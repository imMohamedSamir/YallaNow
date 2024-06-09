import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/popular_food_category.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/restrunt_details/restrunt_details.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/top_categ_resturant.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/search_result_model.dart';

abstract class FoodRepo {
  Future<Either<Failure, RestruntDetails>> fetchResturantBranches(
      {required String restaurantId});
  Future<Either<Failure, List<PopularFoodCategory>>> fetchPopularCategory();
  Future<Either<Failure, List<TopCategResturant>>> fetchPopularCategoryPage(
      {required String categoryId});
  Future<Either<Failure, List<SearchResultModel>>> fetchSearch(
      {required String input});
}
