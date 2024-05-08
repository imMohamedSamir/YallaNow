import 'package:hive/hive.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/restrunt_details/extra.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/restrunt_details/size.dart';
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
  final String? quantity;
  @HiveField(4)
  final String? itemID;
  @HiveField(5)
  final ItemSize? size;
  @HiveField(6)
  final List<Extra>? extras;

  SelectedItemsModel({
    this.itemID,
    required this.name,
    required this.price,
    required this.img,
    this.quantity,
    this.size,
    this.extras,
  });
}
