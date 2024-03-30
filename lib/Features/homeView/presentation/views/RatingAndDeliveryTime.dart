import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/homeView/data/Models/PopularResturanModel.dart';

class RatingAndDeliveryTime extends StatelessWidget {
  const RatingAndDeliveryTime({
    super.key,
    required this.resturantModel,
  });

  final popularResturantModel resturantModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star_rate_rounded, color: Color(0xffFEC400)),
        const SizedBox(width: 4),
        Text(resturantModel.rating.toString(),
            style: AppStyles.styleRegular10(context)),
        const SizedBox(width: 10),
        Image.asset(
          Assets.imagesMotorbike,
          width: AppSizes.getWidth(12, context),
          height: AppSizes.getWidth(12, context),
        ),
        const SizedBox(width: 4),
        Text(" ${resturantModel.deliveryTime} min".toString(),
            style: AppStyles.styleRegular10(context))
      ],
    );
  }
}
