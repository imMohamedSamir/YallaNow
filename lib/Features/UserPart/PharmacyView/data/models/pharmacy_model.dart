import 'package:yallanow/Features/UserPart/FavoriteView/data/models/FavoriteCardModel.dart';

class PharmacyModel {
  String? name;
  double? deliveryFees;
  String? id;
  String? openningTime;
  String? closingTime;
  String? phoneNumber;
  int? rate;
  String? imgUrl;
  String? describtion;
  String? deliveryTime;
  String? addressId;

  PharmacyModel({
    this.name,
    this.deliveryFees,
    this.id,
    this.openningTime,
    this.closingTime,
    this.phoneNumber,
    this.rate,
    this.imgUrl,
    this.describtion,
    this.deliveryTime,
    this.addressId,
  });

  factory PharmacyModel.fromJson(Map<String, dynamic> json) => PharmacyModel(
        name: json['name'] as String?,
        deliveryFees: json['deliveryFees'] as double?,
        id: json['id'] as String?,
        openningTime: json['openningTime'] as String?,
        closingTime: json['closingTime'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        rate: json['rate'] as int?,
        describtion: json['describtion'] as String?,
        imgUrl: json['imgUrl'] as String?,
        deliveryTime: json['deliveryTime'] as String?,
        addressId: json['addressId'] as String?,
      );
  PharmacyModel.fromFavoriteCard(FavoriteCardModel favoriteCard)
      : id = favoriteCard.id,
        name = favoriteCard.name,
        describtion = favoriteCard.description,
        imgUrl = favoriteCard.img,
        deliveryTime = favoriteCard.deliveryTime,
        deliveryFees = double.tryParse(favoriteCard.deliveryPrice ?? ''),
        rate = int.tryParse(favoriteCard.rating ?? '');
  Map<String, dynamic> toJson() => {
        'name': name,
        'deliveryFees': deliveryFees,
        'id': id,
        'openningTime': openningTime,
        'closingTime': closingTime,
        'phoneNumber': phoneNumber,
        'rate': rate,
        'imgUrl': imgUrl,
        'describtion': describtion,
        'deliveryTime': deliveryTime,
        'addressId': addressId,
      };
}
