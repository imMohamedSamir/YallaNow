import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/PharmacyView/data/models/PharmacyHealtModel.dart';

class PharmacyHealthCard extends StatelessWidget {
  const PharmacyHealthCard({
    super.key,
    required this.pharmacyHealtModel,
  });
  final PharmacyHealtModel pharmacyHealtModel;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset(
        pharmacyHealtModel.img,
        width: AppSizes.getWidth(78, context),
        height: AppSizes.getHeight(78, context),
        fit: BoxFit.cover,
      ),
      const SizedBox(height: 16),
      Text(
        pharmacyHealtModel.title,
        style: AppStyles.styleMedium14(context)
            .copyWith(color: const Color(0xff424242)),
      )
    ]);
  }
}
