import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/functions/getPadding.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/CardDetailModel.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/categCadDetaisl.dart';
import 'package:yallanow/generated/l10n.dart';

class CategorySec extends StatelessWidget {
  const CategorySec({super.key});
  @override
  Widget build(BuildContext context) {
    List<CardCategDetails> details = [
      CardCategDetails(
          title: S.of(context).scooterRide, img: Assets.imagesScootercateg),
      CardCategDetails(
          title: S.of(context).Trips, img: Assets.imagesTripsCateg),
      CardCategDetails(
          title: S.of(context).Food,
          img: Assets.imagesFood,
          isComingSoon: true),
      CardCategDetails(
          title: S.of(context).pharmacy,
          img: Assets.imagesPharamcyLogo,
          isComingSoon: true),
      CardCategDetails(
          title: S.of(context).marts,
          img: Assets.imagesMarketbasket,
          isComingSoon: true),
      // CardCategDetails(
      //     title: "Bazar", img: Assets.imagesMarketbasket, isComingSoon: true),
    ];
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, mainAxisSpacing: 8),
      itemCount: details.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: getPadding(index: index, lastIndex: 2, paddingValue: 16),
          child: Card(
              elevation: .9,
              child: CategCardDetails(
                cardDetails: details[index],
                index: index,
              )),
        );
      },
    );
  }
}
