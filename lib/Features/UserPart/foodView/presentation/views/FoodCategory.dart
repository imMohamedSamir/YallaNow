import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/popular_food_category.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodCategImg.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodTopCategPage.dart';

class FoodCategory extends StatelessWidget {
  const FoodCategory({
    super.key,
    required this.color,
    required this.popularFoodCategory,
  });
  final PopularFoodCategory popularFoodCategory;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodTopCategPage(
                  categTitle: popularFoodCategory.name!,
                  categID: popularFoodCategory.type!),
            ));
      },
      child: Column(children: [
        FoodCategImg(
          color: color,
          popularFoodCategory: popularFoodCategory,
        ),
        const SizedBox(height: 12),
        Text(
          popularFoodCategory.name ?? "",
          style: AppStyles.styleMedium14(context),
        )
      ]),
    );
  }
}
