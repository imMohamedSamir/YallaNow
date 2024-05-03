import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodBottomBarDetails.dart';
import 'package:yallanow/main.dart';

class FoodBottomBar extends StatelessWidget {
  const FoodBottomBar({super.key});
  final bool active = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(108, context),
      child: Column(
        children: [
          const SizedBox(height: 10),
          active
              ? const SizedBox()
              : Text("Add EGP 20.00 to start your order",
                  style: AppStyles.styleRegular16(context)
                      .copyWith(color: const Color(0xff5A5A5A))),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              if (active) {
                Navigator.pushNamed(context, RoutesNames.basket);
              }
            },
            child: Container(
              height: AppSizes.getHeight(54, context),
              width: AppSizes.getWidth(361, context),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: active ? pKcolor : pKcolor.withOpacity(0.6)),
              child: const FoodBottomBarDetails(),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
