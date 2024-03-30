import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';

class FoodCategImg extends StatelessWidget {
  const FoodCategImg({super.key, required this.hight});
  final double hight;

  @override
  Widget build(BuildContext context) {
    // print(hight * 0.53 - 20);
    return Container(
      height: hight * 0.53,
      width: hight * 0.53,
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: Color.fromARGB(255, 220, 211, 234)),
      child: Center(
        child: Image.asset(
          Assets.imagesBurgerIcon,
          width: hight * 0.53 - 20,
          height: hight * 0.53 - 20,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
