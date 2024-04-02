import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/homeView/data/Models/PopularResturanModel.dart';
import 'package:yallanow/Features/homeView/presentation/views/PopularResturantCard.dart';

class ExploreRestaurantLV extends StatelessWidget {
  const ExploreRestaurantLV({super.key});
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
    double width = MediaQuery.of(context).size.width * 0.92;
    double height = MediaQuery.of(context).size.height * 0.21;
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: popularResturans.length,
      itemBuilder: (context, index) {
        return RestFoodCard(
          hieght: height,
          resturantModel: popularResturans[index],
          width: width,
        );
      },
    );
  }
}
