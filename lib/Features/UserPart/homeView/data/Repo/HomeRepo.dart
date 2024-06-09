import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/home_marts_model.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/popular_resturants.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/search_result_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<PopularResturants>>> fetchPopularResturant();
  Future<Either<Failure, List<HomeMartsModel>>> fetchPopularMarts();
  Future<Either<Failure, List<SearchResultModel>>> fetchSearchResults(
      {required String input});
}
