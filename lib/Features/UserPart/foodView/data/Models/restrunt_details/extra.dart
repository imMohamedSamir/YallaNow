import 'package:hive_flutter/hive_flutter.dart';
part 'extra.g.dart';

@HiveType(typeId: 3)
class Extra extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  num? price;
  @HiveField(2)
  String? description;

  Extra({this.name, this.price, this.description});

  factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        name: json['name'] as String?,
        price: json['price'] as num?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
        'description': description,
      };
}
