import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/PharmacyView/data/models/PharmacyCategoryModel.dart';

class PharmacyCategoryCard extends StatelessWidget {
  const PharmacyCategoryCard(
      {super.key, required this.pharmacyCategoryModel, required this.color});
  final PharmacyCategoryModel pharmacyCategoryModel;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.bottomCenter,
        width: AppSizes.getWidth(60, context),
        height: AppSizes.getHeight(60, context),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Center(
          child: Image.asset(
            pharmacyCategoryModel.img,
            scale: 4,
            fit: BoxFit.cover,
          ),
        ),
      ),
      const SizedBox(height: 16),
      Text(
        pharmacyCategoryModel.name,
        style: AppStyles.styleMedium14(context)
            .copyWith(color: const Color(0xff424242)),
      )
    ]);
  }
}
