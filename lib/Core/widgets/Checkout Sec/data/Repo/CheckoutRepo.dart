import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/data/Models/place_order_model.dart';

abstract class CheckOutRepo {
  Future<Either<Failure, dynamic>> fetchPlaceOrder(
      {required PlaceOrderModel orderDetails});
}
