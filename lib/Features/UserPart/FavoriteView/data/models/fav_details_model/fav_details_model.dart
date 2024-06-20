import 'package:yallanow/Features/UserPart/FavoriteView/data/models/fav_details_model/FavMarket.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/data/models/fav_details_model/FavPharmacy.dart';

import 'FavRestaurant.dart';

class FavDetailsModel {
  List<FavRestaurant>? restaurant;
  List<FavMarket>? market;
  List<FavPharmacy>? pharmacy;

  FavDetailsModel({this.restaurant, this.market, this.pharmacy});

  factory FavDetailsModel.fromJson(Map<String, dynamic> json) {
    return FavDetailsModel(
      restaurant: (json['Restaurant'] as List<dynamic>?)
          ?.map((e) => FavRestaurant.fromJson(e as Map<String, dynamic>))
          .toList(),
      market: (json['Market'] as List<dynamic>?)
          ?.map((e) => FavMarket.fromJson(e as Map<String, dynamic>))
          .toList(),
      pharmacy: (json['Pharmacy'] as List<dynamic>?)
          ?.map((e) => FavPharmacy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'Restaurant': restaurant?.map((e) => e.toJson()).toList(),
        'Market': market?.map((e) => e.toJson()).toList(),
        'Pharmacy': pharmacy?.map((e) => e.toJson()).toList(),
      };
}
