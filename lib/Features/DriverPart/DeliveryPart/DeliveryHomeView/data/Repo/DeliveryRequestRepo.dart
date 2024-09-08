import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';

abstract class DeliveryRequestRepo {
  Future<Either<Failure, dynamic>> disconnect();
}
