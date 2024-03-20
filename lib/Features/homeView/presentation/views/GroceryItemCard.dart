import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/homeView/presentation/views/GroceryAddIcon.dart';

class GroceryItemCard extends StatelessWidget {
  const GroceryItemCard({
    super.key,
    required this.width,
  });
  final double width;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: width,
        decoration: BoxDecoration(
            color: const Color(0xffF5F5F5),
            borderRadius: BorderRadius.circular(16)),
        child: Stack(
          children: [
            // Positioned(left: 0, top: 0, child: SalesMark(width: width)),
            Positioned(
                top: 15,
                left: 14,
                right: 14,
                child: Image.asset(Assets.imagesGrocery1,
                    width: width * 0.81, height: width * 0.81)),
            const Positioned(right: 7, bottom: 7, child: GroceryAddIcon())
          ],
        ),
      ),
    );
  }
}
