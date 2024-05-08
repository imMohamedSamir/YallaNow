class MartsModel {
  String? name;
  String? deliveryTime;
  double? deliveryFees;
  String? id;
  String? openningTime;
  String? closingTime;
  String? address;
  String? phoneNumber;
  int? rate;
  String? imgUrl;
  MartsModel({
    this.name,
    this.deliveryTime,
    this.deliveryFees,
    this.id,
    this.openningTime,
    this.closingTime,
    this.address,
    this.imgUrl,
    this.phoneNumber,
    this.rate,
  });

  factory MartsModel.fromJson(Map<String, dynamic> json) => MartsModel(
        name: json['name'] as String?,
        deliveryTime: json['deliveryTime'] as String?,
        deliveryFees: json['deliveryFees'] as double?,
        id: json['id'] as String?,
        openningTime: json['openningTime'] as String?,
        closingTime: json['closingTime'] as String?,
        address: json['address'] as String?,
        imgUrl: json['imgUrl'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        rate: json['rate'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'deliveryTime': deliveryTime,
        'deliveryFees': deliveryFees,
        'id': id,
        'openningTime': openningTime,
        'closingTime': closingTime,
        'address': address,
        'imgUrl': imgUrl,
        'phoneNumber': phoneNumber,
        'rate': rate,
      };
}
