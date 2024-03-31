import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/MarketsView/data/models/SuperMarketsModel.dart';
import 'package:yallanow/main.dart';

class SuperMarketCard extends StatelessWidget {
  const SuperMarketCard({super.key, required this.superMarketsModel});
  final SuperMarketsModel superMarketsModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routesNames.Marketpage);
      },
      child: SizedBox(
        height: AppSizes.getHeight(92, context),
        child: ListTile(
          leading: Image.asset(
            superMarketsModel.img,
            height: AppSizes.getHeight(60, context),
            width: AppSizes.getWidth(60, context),
            fit: BoxFit.cover,
          ),
          title: Text(superMarketsModel.name,
              style: AppStyles.styleSemiBold16(context)),
          subtitle: Row(
            children: [
              Icon(Icons.access_time_rounded,
                  color: const Color(0xff5A5A5A),
                  size: AppSizes.getHeight(12, context)),
              const SizedBox(width: 4),
              Text("${superMarketsModel.deliveryTime} min",
                  style: AppStyles.styleRegular10(context)),
              const SizedBox(width: 18),
              Image.asset(
                Assets.imagesMotorbike,
                width: AppSizes.getWidth(12, context),
                height: AppSizes.getHeight(12, context),
              ),
              const SizedBox(width: 4),
              Text(superMarketsModel.deliveryPrice,
                  style: AppStyles.styleRegular10(context)),
              const Spacer(),
              Icon(
                Icons.star_rate_rounded,
                color: const Color(0xffFEC400),
                size: AppSizes.getWidth(12, context),
              ),
              const SizedBox(width: 4),
              Text(superMarketsModel.rating,
                  style: AppStyles.styleRegular10(context)),
            ],
          ),
        ),
      ),
    );
  }
}
