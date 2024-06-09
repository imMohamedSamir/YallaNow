import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/basket_item_model/basket_item_model.dart';

abstract class BasketRepo {
  Future<Either<Failure, dynamic>> fetchResturantBranches(
      {required List<BasketItemModel> items});
}
