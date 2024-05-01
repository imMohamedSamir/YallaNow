import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/popular_food_category.dart';

class FoodCategImg extends StatelessWidget {
  const FoodCategImg(
      {super.key, required this.color, required this.popularFoodCategory});
  final Color color;
  final PopularFoodCategory popularFoodCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.getHeight(60, context),
      width: AppSizes.getHeight(60, context),
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Center(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Image.network(
                height: AppSizes.getHeight(50, context),
                width: AppSizes.getHeight(50, context),
                popularFoodCategory.imageUrl!.contains("wwwroot")
                    ? "http://yallanow.runasp.net/images/0828ac6f-56e4-4f44-a50d-fa9a60fa2db7_download%20(2).jpg"
                    : popularFoodCategory.imageUrl!,
                fit: BoxFit.fill)),
      ),
    );
  }
}
