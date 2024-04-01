import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/homeView/presentation/views/OffersPageView.dart';
import 'package:yallanow/Features/homeView/presentation/views/offersSec.dart';

class PharmacyOffersSec extends StatelessWidget {
  const PharmacyOffersSec({super.key});
  static List<OfferDetailsModel> offers = [
    OfferDetailsModel(
        title: "30%",
        subtitle: "Friday Offer!",
        description: "Get discount up to 30%",
        img: Assets.imagesPharmacyOffer),
    OfferDetailsModel(
        title: "5%",
        subtitle: "Friday Offer!",
        description: "Get discount up to 30%",
        img: Assets.imagesPharmacyOffer),
    OfferDetailsModel(
        title: "10%",
        subtitle: "Friday Offer!",
        description: "Get discount up to 30%",
        img: Assets.imagesPharmacyOffer),
    OfferDetailsModel(
        title: "20%",
        subtitle: "Friday Offer!",
        description: "Get discount up to 30%",
        img: Assets.imagesPharmacyOffer)
  ];
  @override
  Widget build(BuildContext context) {
    return OffersSec(
      offers: offers,
      color1: const Color(0xffDCD3E0),
      color2: const Color(0xffECE1F1),
    );
  }
}
