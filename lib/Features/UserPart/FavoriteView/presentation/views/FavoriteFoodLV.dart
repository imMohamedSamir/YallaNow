import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/data/models/FavoriteCardModel.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/presentation/views/FavoriteCard.dart';

class FavoriteFoodLV extends StatelessWidget {
  const FavoriteFoodLV({super.key});
  static List<FavoriteCardModel> favorits = [
    FavoriteCardModel(
        name: " Lorem Name",
        description: "Restaurant type description",
        img: Assets.imagesMeal1,
        deliveryTime: "20",
        deliveryPrice: "free",
        rating: "3.5"),
    FavoriteCardModel(
        name: "Lorem Name ",
        description: "Restaurant type description",
        img: Assets.imagesMeal2,
        deliveryTime: "10",
        deliveryPrice: "10 EGP",
        rating: "4"),
    FavoriteCardModel(
        name: " Lorem Name",
        description: "Restaurant type description",
        img: Assets.imagesMeal1,
        deliveryTime: "30",
        deliveryPrice: "free",
        rating: "2"),
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
