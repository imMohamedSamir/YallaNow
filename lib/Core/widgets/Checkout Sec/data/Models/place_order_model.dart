class PlaceOrderModel {
  String? addressid;
  String? phonenumber;
  int? paymentMethod;
  String? orderNotes;
  String? partnerId;
  int? partnerType;

  PlaceOrderModel({
    this.addressid,
    this.phonenumber,
    this.paymentMethod,
    this.orderNotes,
    this.partnerId,
    this.partnerType,
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
      };
}
