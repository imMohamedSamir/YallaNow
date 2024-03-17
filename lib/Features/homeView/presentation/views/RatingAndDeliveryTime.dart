import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/homeView/data/Models/PopularResturanModel.dart';

class RatingAndDeliveryTime extends StatelessWidget {
  const RatingAndDeliveryTime({
    super.key,
    required this.resturantModel,
    required this.hieght,
  });

  final popularResturantModel resturantModel;
  final double hieght;
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
          width: hieght * 0.07,
          height: hieght * 0.07,
        ),
        const SizedBox(width: 4),
        Text(" ${resturantModel.deliveryTime} min".toString(),
            style: AppStyles.styleRegular10(context))
      ],
    );
  }
}
