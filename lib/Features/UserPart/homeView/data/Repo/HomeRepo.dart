import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/popular_resturants.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<PopularResturants>>> fetchPopularResturant();
}
