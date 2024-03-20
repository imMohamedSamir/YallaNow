import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/homeView/presentation/views/RideOffersHeaderDetails.dart';

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
        width: width,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 241, 227, 227),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            RideOffersHeaderDetails(width: width),
            const Spacer(),
            Image.asset(
              Assets.imagesScooterOffer,
              height: height * 0.57,
              width: height * 0.57 - 2.3,
            )
          ],
        ),
      ),
    );
  }
}
