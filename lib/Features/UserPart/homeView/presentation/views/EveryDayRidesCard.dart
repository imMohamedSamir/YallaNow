import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/RideOffersHeaderDetails.dart';

class EveryDayRidesCard extends StatelessWidget {
  const EveryDayRidesCard(
      {super.key, required this.height, required this.width});
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 5, top: 20, bottom: 5),
        width: AppSizes.getWidth(240, context),
        height: AppSizes.getHeight(140, context),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 241, 227, 227),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            RideOffersHeaderDetails(width: width),
            const Spacer(),
            AspectRatio(
              aspectRatio: 75 / 95,
              child: Image.asset(
                Assets.imagesScooterOffer,
                // height: AppSizes.getHeight(95, context),
                // width: AppSizes.getWidth(106, context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
