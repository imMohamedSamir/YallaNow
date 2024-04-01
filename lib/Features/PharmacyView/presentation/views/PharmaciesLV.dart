import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/PharmacyView/data/models/PharmacyModel.dart';
import 'package:yallanow/Features/PharmacyView/presentation/views/PharmacyCard.dart';

class PharmaciesLV extends StatelessWidget {
  const PharmaciesLV({super.key});
  static List<PharmacyModel> pharmacies = [
    PharmacyModel(
        name: " Elezaby",
        description: "Restaurant type description",
        img: Assets.imagesPharmacy1,
        deliveryTime: "20",
        deliveryPrice: "free",
        rating: "3.5"),
    PharmacyModel(
        name: "رشدي ",
        description: "Restaurant type description",
        img: Assets.imagesPharmacy2,
        deliveryTime: "10",
        deliveryPrice: "10 EGP",
        rating: "4"),
    PharmacyModel(
        name: " Elezaby",
        description: "Restaurant type description",
        img: Assets.imagesPharmacy1,
        deliveryTime: "30",
        deliveryPrice: "free",
        rating: "2"),
    PharmacyModel(
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
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: pharmacies.length,
      itemBuilder: (context, index) {
        final isLastIndex = index == pharmacies.length - 1;
        return Padding(
          padding: EdgeInsets.only(bottom: isLastIndex ? 0 : 16),
          child: PharmacyCard(
            pharmacyModel: pharmacies[index],
          ),
        );
      },
    );
  }
}
