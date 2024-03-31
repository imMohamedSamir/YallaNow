import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Features/homeView/presentation/views/GroceryAddIcon.dart';

class GroceryItemCard extends StatelessWidget {
  const GroceryItemCard({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: AppSizes.getWidth(148, context),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 240, 220, 220),
            borderRadius: BorderRadius.circular(16)),
        child: Stack(
          children: [
            // Positioned(left: 0, top: 0, child: SalesMark(width: width)),
            Positioned(
              top: 0,
              left: 14,
              right: 14,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  Assets.imagesGrocery1,
                ),
              ),
            ),
            const Positioned(right: 7, bottom: 7, child: GroceryAddIcon())
          ],
        ),
      ),
    );
  }
}
