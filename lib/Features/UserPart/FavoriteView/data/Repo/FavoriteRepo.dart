import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/data/models/add_fav_model.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/data/models/fav_details_model/fav_details_model.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, dynamic>> addToFavorits(
      {required AddFavModel favModel});
  Future<Either<Failure, dynamic>> removeFav({required String favId});
  Future<Either<Failure, FavDetailsModel>> getFav();
}
