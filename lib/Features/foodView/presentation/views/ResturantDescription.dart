import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class ResturantDescription extends StatelessWidget {
  const ResturantDescription({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Burger lover", style: AppStyles.styleSemiBold20(context)),
            const SizedBox(height: 4),
            Text("Restaurant type description",
                style: AppStyles.styleRegular16(context)
                    .copyWith(color: const Color(0xff5A5A5A))),
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(Icons.access_time_rounded,
                    color: const Color(0xff5A5A5A), size: width * 0.033),
                const SizedBox(width: 4),
                Text("20 min", style: AppStyles.styleRegular10(context)),
                const SizedBox(width: 18),
                Image.asset(
                  Assets.imagesMotorbike,
                  width: width * 0.03,
                  height: width * 0.03,
                ),
                const SizedBox(width: 4),
                Text("Free", style: AppStyles.styleRegular10(context))
              ],
            ),
          ],
        ),
        const Spacer(),
        Icon(
          Icons.star_rate_rounded,
          color: const Color(0xffFEC400),
          size: width * 0.04,
        ),
        const SizedBox(width: 4),
        Text("4.5 (700) Ratings ", style: AppStyles.styleRegular10(context)),
      ],
    );
  }
}
