import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/popular_resturants.dart';

class RatingAndDeliveryTime extends StatelessWidget {
  const RatingAndDeliveryTime({
    super.key,
    required this.popularResturants,
  });

  final PopularResturants popularResturants;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star_rate_rounded, color: Color(0xffFEC400), size: 18),
        const SizedBox(width: 4),
        Text(popularResturants.rate.toString(),
            style: AppStyles.styleRegular10(context)),
        const SizedBox(width: 10),
        Image.asset(
          Assets.imagesMotorbike,
          width: AppSizes.getWidth(12, context),
          height: AppSizes.getWidth(12, context),
        ),
        const SizedBox(width: 4),
        Text(" ${popularResturants.deliveryTime} min",
            style: AppStyles.styleRegular10(context))
      ],
    );
  }
}
