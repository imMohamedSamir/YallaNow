import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/foodView/presentation/views/FoodCategImg.dart';

class FoodCategory extends StatelessWidget {
  const FoodCategory({super.key, required this.hight});
  final double hight;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Column(children: [
        FoodCategImg(hight: hight),
        const SizedBox(height: 12),
        Text(
          "Burger",
          style: AppStyles.styleMedium14(context),
        )
      ]),
    );
  }
}
