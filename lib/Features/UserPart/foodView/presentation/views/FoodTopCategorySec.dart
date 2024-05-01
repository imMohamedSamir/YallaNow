import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodCategoryLV.dart';

class FoodTopCategorySec extends StatelessWidget {
  const FoodTopCategorySec({super.key});

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
