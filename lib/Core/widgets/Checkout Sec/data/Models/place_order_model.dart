import 'package:yallanow/Features/UserPart/BasketView/data/models/basket_item_model/basket_item_model.dart';

class PlaceOrderModel {
  String? addressid;
  String? phonenumber;
  int? paymentMethod;
  String? orderNotes;
  String? partnerId;
  int? partnerType;
  String? itemNotes;
  double? changeAmount;
  double? subTotalAmount;
  double? deliveryFee;
  double? serviceFee;

  List<BasketItemModel>? items;

  PlaceOrderModel({
    this.addressid,
    this.phonenumber,
    this.paymentMethod,
    this.orderNotes,
    this.partnerId,
    this.partnerType,
    this.itemNotes,
    this.changeAmount,
    this.subTotalAmount,
    this.deliveryFee,
    this.serviceFee,
    this.items,
  });

  factory PlaceOrderModel.fromJson(Map<String, dynamic> json) {
    return PlaceOrderModel(
      addressid: json['addressid'] as String?,
      phonenumber: json['phonenumber'] as String?,
      paymentMethod: json['paymentMethod'] as int?,
      orderNotes: json['orderNotes'] as String?,
      partnerId: json['partnerId'] as String?,
      partnerType: json['partnerType'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'addressid': addressid,
        'phonenumber': phonenumber,
        'paymentMethod': paymentMethod,
        'orderNotes': orderNotes,
        'partnerId': partnerId,
        'partnerType': partnerType,
        'itemNotes': itemNotes,
        'changeAmount': changeAmount,
        "subTotalAmount": subTotalAmount,
        "deliveryFee": deliveryFee,
        "serviceFee": serviceFee,
        'items': items?.map((e) => e.toJson()).toList(),
      };
}
