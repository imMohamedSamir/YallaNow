import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/functions/DialogMethode.dart';
import 'package:yallanow/Features/foodView/presentation/views/ResturantHeaderIcon.dart';

class FoodItemAppBar extends StatelessWidget {
  const FoodItemAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height * 0.242;
    return Container(
        padding: const EdgeInsets.only(top: 55, left: 16),
        width: width,
        height: height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.imagesFoodItemImg), fit: BoxFit.fill)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResturantHeaderIcon(
              child: const Icon(Icons.close, size: 21),
              onPressed: () => dialogMethode(context),
            ),
          ],
        ));
  }
}
