import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/SuperMarketsModel.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/SuperMarketCard.dart';

class SuperMarketsLV extends StatelessWidget {
  const SuperMarketsLV({super.key});
  static List<SuperMarketsModel> superMarkets = [
    SuperMarketsModel(
        name: "خير زمان",
        img: Assets.imagesSupermarket1,
        deliveryTime: "20",
        deliveryPrice: "free",
        rating: "3.5"),
    SuperMarketsModel(
        name: "Metro",
        img: Assets.imagesSupermarket1,
        deliveryTime: "10",
        deliveryPrice: "10 EGP",
        rating: "4"),
    SuperMarketsModel(
        name: " كارفور",
        img: Assets.imagesSupermarket1,
        deliveryTime: "30",
        deliveryPrice: "free",
        rating: "2"),
    SuperMarketsModel(
        name: "خير زمان",
        img: Assets.imagesSupermarket1,
        deliveryTime: "20",
        deliveryPrice: "free",
        rating: "4")
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: superMarkets.length,
      itemBuilder: (context, index) {
        final isLastIndex = index == superMarkets.length - 1;
        return Padding(
          padding: EdgeInsets.only(
            bottom: isLastIndex
                ? 0
                : 16, // Set bottom padding to 0 for the last item
          ),
          child: SuperMarketCard(
            superMarketsModel: superMarkets[index],
          ),
        );
      },
    );
  }
}
