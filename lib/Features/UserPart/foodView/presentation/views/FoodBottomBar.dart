import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodBottomBarDetails.dart';
import 'package:yallanow/main.dart';

class FoodBottomBar extends StatelessWidget {
  const FoodBottomBar({super.key});
  final bool active = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.13,
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
                Navigator.pushNamed(context, routesNames.basket);
              }
            },
            child: Container(
              height: height * 0.065,
              width: width * 0.91,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: active
                      ? const Color(0xffB20404)
                      : const Color(0xffB20404).withOpacity(0.6)),
              child: FoodBottomBarDetails(width: width, height: height),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
