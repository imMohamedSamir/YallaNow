import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class ScooterDetailsSec extends StatelessWidget {
  const ScooterDetailsSec({
    super.key,
    required this.type,
    required this.color,
    required this.plate,
  });
  final String type, color, plate;
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
        Text("$type, $color", style: AppStyles.styleRegular12(context)),
        const Spacer(),
        Text(plate, style: AppStyles.styleRegular12(context)),
      ],
    );
  }
}
