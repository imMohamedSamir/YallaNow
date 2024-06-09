import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class DriverDetails extends StatelessWidget {
  const DriverDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Image.asset(
            Assets.imagesDriverImg,
            width: AppSizes.getWidth(70, context),
            height: AppSizes.getHeight(70, context),
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Kareem", style: AppStyles.styleRegular16(context)),
            DriverRatingIndicator(rate: 3)
          ],
        )
      ],
    );
  }
}

class DriverRatingIndicator extends StatelessWidget {
  const DriverRatingIndicator({
    super.key,
    required this.rate,
  });
  final double rate;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rate,
      itemCount: 5,
      unratedColor: Colors.grey,
      itemSize: 26,
      itemBuilder: (context, index) {
        return const Icon(Icons.star_rate_rounded, color: Color(0xffFEC400));
      },
    );
  }
}
