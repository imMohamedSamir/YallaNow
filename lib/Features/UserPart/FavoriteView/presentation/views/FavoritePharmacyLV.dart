import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/data/models/FavoriteCardModel.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/presentation/views/FavoriteCard.dart';

class FavoritePharmacyLV extends StatelessWidget {
  const FavoritePharmacyLV({super.key});
  static List<FavoriteCardModel> favorits = [
    FavoriteCardModel(
        name: " Elezaby",
        description: "Restaurant type description",
        img: Assets.imagesPharmacy1,
        deliveryTime: "20",
        deliveryPrice: "free",
        rating: "3.5"),
    FavoriteCardModel(
        name: "رشدي ",
        description: "Restaurant type description",
        img: Assets.imagesPharmacy2,
        deliveryTime: "10",
        deliveryPrice: "10 EGP",
        rating: "4"),
    FavoriteCardModel(
        name: " Elezaby",
        description: "Restaurant type description",
        img: Assets.imagesPharmacy1,
        deliveryTime: "30",
        deliveryPrice: "free",
        rating: "2"),
    FavoriteCardModel(
        name: "مصر",
        description: "Restaurant type description",
        img: Assets.imagesPharmacy2,
        deliveryTime: "20",
        deliveryPrice: "free",
        rating: "4")
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favorits.length,
      itemBuilder: (context, index) {
        final isLastIndex = index == favorits.length - 1;
        return Padding(
          padding: EdgeInsets.only(bottom: isLastIndex ? 0 : 16),
          child: FavoriteCard(
            favoriteCardModel: favorits[index],
          ),
        );
      },
    );
  }
}
