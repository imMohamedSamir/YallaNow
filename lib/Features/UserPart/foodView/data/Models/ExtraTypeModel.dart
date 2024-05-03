import 'package:hive_flutter/adapters.dart';
part 'ExtraTypeModel.g.dart';

@HiveType(typeId: 2)
class ExtraTypeModel extends HiveObject {
  @HiveField(0)
  final String type;
  @HiveField(1)
  final String price;
  ExtraTypeModel({required this.type, required this.price});
}

class SizeModel {
  final String size;
  final String price;

  SizeModel({
    required this.size,
    required this.price,
  });
}
