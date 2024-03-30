import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: AppSizes.getHeight(100, context),
          width: AppSizes.getWidth(164, context),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                  image: AssetImage(Assets.imagesFoodItemImg),
                  fit: BoxFit.fill)),
        ),
        Text("Lorem Name", style: AppStyles.styleSemiBold16(context)),
        Text("300.00 EGP",
            style: AppStyles.styleRegular10(context)
                .copyWith(color: const Color(0xffB20404))),
        Text(
          "400.00 EGP",
          style: AppStyles.styleRegular10(context).copyWith(
            color: const Color(0xff5A5A5A),
            decoration: TextDecoration.lineThrough, // Add line through
          ),
        )
      ],
    );
  }
}
