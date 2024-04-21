import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';

class DriverDetailsSec extends StatelessWidget {
  const DriverDetailsSec({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Image.asset(Assets.imagesDriverImg,
              height: AppSizes.getHeight(32, context),
              width: AppSizes.getWidth(32, context),
              fit: BoxFit.contain),
        ),
        const SizedBox(width: 12),
        Text("Kareem",
            style: AppStyles.styleRegular12(context).copyWith(color: scColor)),
        const Spacer(),
        const Icon(Icons.star_rounded, color: Color(0xffFEC400), size: 14),
        const SizedBox(width: 4),
        Text("4.5", style: AppStyles.styleRegular12(context)),
        const SizedBox(width: 4),
        Text("(Top rated)", style: AppStyles.styleRegular12(context))
      ],
    );
  }
}
