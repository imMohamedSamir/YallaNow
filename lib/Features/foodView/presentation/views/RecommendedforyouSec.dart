import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/homeView/data/Models/PopularResturanModel.dart';
import 'package:yallanow/Features/homeView/presentation/views/PopularResturansLV.dart';

class RecommendedforyouSec extends StatelessWidget {
  const RecommendedforyouSec({super.key});
  static List<popularResturantModel> popularResturans = [
    popularResturantModel(
        RestName: "KFC",
        Description: "Description",
        img: Assets.imagesMeal1,
        rating: 4,
        deliveryTime: 30),
    popularResturantModel(
        RestName: "McDonalds",
        Description: "Description",
        img: Assets.imagesMeal2,
        rating: 1,
        deliveryTime: 60),
    popularResturantModel(
        RestName: "KFC",
        Description: "Description",
        img: Assets.imagesMeal1,
        rating: 4,
        deliveryTime: 30),
    popularResturantModel(
        RestName: "McDonalds",
        Description: "Description",
        img: Assets.imagesMeal2,
        rating: 1,
        deliveryTime: 60)
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Recommended for you", style: AppStyles.styleMedium16(context)),
        PopularResturansLV(
          popularResturans: popularResturans,
        )
      ],
    );
  }
}
