import 'BasketItemExtra.dart';
import 'BasketItemSize.dart';

class BasketItemModel {
  String? productId;
  String? partnerId;
  int? partnerType;
  double? price;
  int? quantity;
  List<BasketItemExtra>? itemExtras;
  List<BasketItemSize>? itemSizes;

  BasketItemModel({
    this.productId,
    this.partnerId,
    this.partnerType,
    this.price,
    this.quantity,
    this.itemExtras,
    this.itemSizes,
  });

  factory BasketItemModel.fromJson(Map<String, dynamic> json) {
    return BasketItemModel(
      productId: json['productId'] as String?,
      partnerId: json['partnerId'] as String?,
      partnerType: json['partnerType'] as int?,
      price: json['price'] as double?,
      quantity: json['quantity'] as int?,
      itemExtras: (json['itemExtras'] as List<dynamic>?)
          ?.map((e) => BasketItemExtra.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemSizes: (json['itemSizes'] as List<dynamic>?)
          ?.map((e) => BasketItemSize.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'partnerId': partnerId,
        'partnerType': partnerType,
        'price': price,
        'quantity': quantity,
        'itemExtras': itemExtras?.map((e) => e.toJson()).toList(),
        'itemSizes': itemSizes?.map((e) => e.toJson()).toList(),
      };
}
