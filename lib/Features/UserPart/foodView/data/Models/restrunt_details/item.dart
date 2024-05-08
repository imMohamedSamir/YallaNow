import 'extra.dart';
import 'size.dart';

class Item {
  String? itemId;
  String? itemName;
  String? itemDescription;
  String? itemImageUrl;
  double? itemPrice;
  List<Extra>? extras;
  List<ItemSize>? sizes;

  Item({
    this.itemId,
    this.itemName,
    this.itemDescription,
    this.itemImageUrl,
    this.itemPrice,
    this.extras,
    this.sizes,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemId: json['itemId'] as String?,
        itemName: json['itemName'] as String?,
        itemDescription: json['itemDescription'] as String?,
        itemImageUrl: json['itemImageUrl'] as String?,
        itemPrice: json['itemPrice'] as double?,
        extras: (json['extras'] as List<dynamic>?)
            ?.map((e) => Extra.fromJson(e as Map<String, dynamic>))
            .toList(),
        sizes: (json['sizes'] as List<dynamic>?)
            ?.map((e) => ItemSize.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'itemId': itemId,
        'itemName': itemName,
        'itemDescription': itemDescription,
        'itemImageUrl': itemImageUrl,
        'itemPrice': itemPrice,
        'extras': extras?.map((e) => e.toJson()).toList(),
        'sizes': sizes?.map((e) => e.toJson()).toList(),
      };
}
