import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodCategory.dart';

class FoodCategoryLV extends StatelessWidget {
  const FoodCategoryLV({super.key});

  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height * 0.136;
    return SizedBox(
      height: hight,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return FoodCategory(hight: hight);
        },
      ),
    );
  }
}

class FoodCategorySec extends StatelessWidget {
  const FoodCategorySec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Top categories", style: AppStyles.styleMedium16(context)),
        const SizedBox(height: 16),
        const FoodCategoryLV()
      ],
    );
  }
}
