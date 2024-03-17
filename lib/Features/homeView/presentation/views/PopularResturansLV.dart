import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/homeView/data/Models/PopularResturanModel.dart';
import 'package:yallanow/Features/homeView/presentation/views/PopularResturantCard.dart';

class PopularResturansLV extends StatelessWidget {
  const PopularResturansLV({super.key});
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
    final double hieght = MediaQuery.of(context).size.height * 0.257;
    return SizedBox(
      height: hieght,
      child: ListView.builder(
        padding: const EdgeInsets.only(right: 12),
        scrollDirection: Axis.horizontal,
        itemCount: popularResturans.length,
        itemBuilder: (context, index) {
          return PopularResturantCard(
            hieght: hieght,
            resturantModel: popularResturans[index],
          );
        },
      ),
    );
  }
}
