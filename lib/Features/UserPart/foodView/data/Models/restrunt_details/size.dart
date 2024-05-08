import 'package:hive_flutter/hive_flutter.dart';
part 'size.g.dart';

@HiveType(typeId: 4)
class ItemSize extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  double? price;
  @HiveField(2)
  String? description;

  ItemSize({this.name, this.price, this.description});

  factory ItemSize.fromJson(Map<String, dynamic> json) => ItemSize(
        name: json['name'] as String?,
        price: json['price'] as double?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
        'description': description,
      };
}
