import 'item.dart';

class Menu {
  String? menuId;
  String? menuName;
  String? menuImageUrl;
  List<FoodItem>? items;

  Menu({this.menuId, this.menuName, this.menuImageUrl, this.items});

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        menuId: json['menuId'] as String?,
        menuName: json['menuName'] as String?,
        menuImageUrl: json['menuImageUrl'] as String?,
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => FoodItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'menuId': menuId,
        'menuName': menuName,
        'menuImageUrl': menuImageUrl,
        'items': items?.map((e) => e.toJson()).toList(),
      };
}
