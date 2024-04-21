import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class ScooterDetailsSec extends StatelessWidget {
  const ScooterDetailsSec({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          Assets.imagesAvailScooter,
          height: AppSizes.getHeight(32, context),
          width: AppSizes.getWidth(32, context),
        ),
        const SizedBox(width: 12),
        Text("Scooter type , color", style: AppStyles.styleRegular12(context)),
        const Spacer(),
        Text("ق م ر  1612", style: AppStyles.styleRegular12(context)),
      ],
    );
  }
}
