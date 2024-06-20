import 'package:yallanow/Features/UserPart/FavoriteView/data/models/fav_details_model/FavMarket.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/data/models/fav_details_model/FavPharmacy.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/data/models/fav_details_model/FavRestaurant.dart';

class FavoriteCardModel {
  final String? id, name, description, deliveryTime, deliveryPrice, rating, img;

  FavoriteCardModel(
      {this.id,
      this.name,
      this.description,
      this.img,
      this.deliveryTime,
      this.deliveryPrice,
      this.rating});
  // Constructor to create a FavoriteCardModel from a Market
  FavoriteCardModel.fromMarket(FavMarket market)
      : id = market.id ?? '',
        name = market.name ?? '',
        description = market.description ?? '',
        img = market.icon ?? '',
        deliveryTime = market.deliveryTime ?? '',
        deliveryPrice = market.deliveryFees?.toString() ?? '',
        rating = market.rate?.toString() ?? '';

  FavoriteCardModel.fromRestaurant(FavRestaurant restaurant)
      : id = restaurant.id ?? '',
        name = restaurant.name ?? '',
        img = restaurant.imageUrl ?? '',
        rating = restaurant.rate.toString(),
        description = restaurant.description ?? '',
        deliveryTime = restaurant.deliveryTime ?? '',
        deliveryPrice = restaurant.deliveryFees ?? '';

  FavoriteCardModel.fromPharmacy(FavPharmacy pharmacy)
      : id = pharmacy.id ?? '',
        name = pharmacy.name ?? '',
        img = pharmacy.icon ?? '',
        rating = pharmacy.rate.toString(),
        description = pharmacy.description ?? '',
        deliveryTime = pharmacy.deliveryTime ?? '',
        deliveryPrice = pharmacy.deliveryFees.toString();
}
