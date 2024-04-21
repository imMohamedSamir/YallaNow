import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/OffersPageView.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/offersSec.dart';

class FoodOffersSec extends StatelessWidget {
  const FoodOffersSec({super.key});

  static List<OfferDetailsModel> offers = [
    OfferDetailsModel(
        title: "30%",
        subtitle: "Friday Offer!",
        description: "Get discount up to 30%",
        img: Assets.imagesBurgerIcon),
    OfferDetailsModel(
        title: "5%",
        subtitle: "Friday Offer!",
        description: "Get discount up to 30%",
        img: Assets.imagesBurgerIcon),
    OfferDetailsModel(
        title: "10%",
        subtitle: "Friday Offer!",
        description: "Get discount up to 30%",
        img: Assets.imagesBurgerIcon),
    OfferDetailsModel(
        title: "20%",
        subtitle: "Friday Offer!",
        description: "Get discount up to 30%",
        img: Assets.imagesBurgerIcon)
  ];
  @override
  Widget build(BuildContext context) {
    return OffersSec(
      offers: offers,
    );
  }
}
