import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/models/pharmacy_model.dart';

class PharmacyDescription extends StatelessWidget {
  const PharmacyDescription({super.key, required this.pharmacy});
  final PharmacyModel pharmacy;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(pharmacy.name!, style: AppStyles.styleSemiBold20(context)),
            const SizedBox(height: 4),
            Text(pharmacy.describtion!,
                style: AppStyles.styleRegular16(context)
                    .copyWith(color: const Color(0xff5A5A5A))),
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(Icons.access_time_rounded,
                    color: const Color(0xff5A5A5A),
                    size: AppSizes.getHeight(14, context)),
                const SizedBox(width: 4),
                Text("${pharmacy.deliveryTime} min",
                    style: AppStyles.styleRegular10(context)),
                const SizedBox(width: 18),
                Image.asset(
                  Assets.imagesMotorbike,
                  width: AppSizes.getHeight(14, context),
                  height: AppSizes.getHeight(14, context),
                ),
                const SizedBox(width: 4),
                Text("${pharmacy.deliveryFees} EGP",
                    style: AppStyles.styleRegular10(context))
              ],
            ),
          ],
        ),
        const Spacer(),
        Icon(
          Icons.star_rate_rounded,
          color: const Color(0xffFEC400),
          size: AppSizes.getWidth(14, context),
        ),
        const SizedBox(width: 4),
        Text("${pharmacy.rate} (700) Ratings ",
            style: AppStyles.styleRegular10(context)),
      ],
    );
  }
}
