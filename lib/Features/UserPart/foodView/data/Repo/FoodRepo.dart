import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/resturant_branch_details/resturant_branch_details.dart';

abstract class FoodRepo {
  Future<Either<Failure, ResturantBranchDetails>> fetchResturantBranches(
      {required String restaurantId});
}
