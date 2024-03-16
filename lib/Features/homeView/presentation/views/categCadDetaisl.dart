import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/homeView/data/Models/CardDetailModel.dart';

class categCardDetails extends StatelessWidget {
  const categCardDetails({super.key, required this.cardDetails});
  final CardDetails cardDetails;
  final double height = 90;
  final double size = 0.65;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: MediaQuery.sizeOf(context).width / 3 - 25,
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xffF5F5F5),
        ),
        child: Stack(
          children: [
            Positioned(
                top: 8,
                left: 10,
                child: Text(cardDetails.title,
                    style: AppStyles.styleSemiBold16(context))),
            Positioned(
              top: 31,
              left: 10,
              child: Text(cardDetails.avgTime,
                  style: AppStyles.styleRegular10(context)
                      .copyWith(color: const Color(0xffB8B8B8))),
            ),
            Positioned(
              top: 35,
              left: 28,
              child: Image.asset(
                cardDetails.img,
                height:
                    MediaQuery.orientationOf(context) == Orientation.landscape
                        ? 3 * height * (size)
                        : height * (size),
                width:
                    MediaQuery.orientationOf(context) == Orientation.landscape
                        ? 3 * height * (size)
                        : height * (.8),
                fit: BoxFit.contain,
              ),
            ),
          ],
        ));
  }
}
