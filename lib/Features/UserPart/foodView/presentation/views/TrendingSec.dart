import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/TrendingGV.dart';

class TrendingSec extends StatelessWidget {
  const TrendingSec({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Row(
            children: [
              Text("Trending", style: AppStyles.styleSemiBold16(context)),
              const SizedBox(width: 4),
              Image.asset(Assets.imagesTrendingIcon,
                  height: AppSizes.getHeight(16, context),
                  width: AppSizes.getWidth(16, context))
            ],
          ),
          const SizedBox(height: 16),
          const TrendingGV()
        ],
      ),
    );
  }
}
