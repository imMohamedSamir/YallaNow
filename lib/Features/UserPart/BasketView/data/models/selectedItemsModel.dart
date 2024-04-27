import 'package:hive/hive.dart';
part 'selectedItemsModel.g.dart';

@HiveType(typeId: 1)
class SelectedItemsModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String price;

  @HiveField(2)
  final String img;

  @HiveField(3)
  final String quantity;

  SelectedItemsModel({
    required this.name,
    required this.price,
    required this.img,
    required this.quantity,
  });
}
