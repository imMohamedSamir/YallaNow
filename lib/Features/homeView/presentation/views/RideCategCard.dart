import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class RideCateg extends StatelessWidget {
  const RideCateg({super.key});
  final double height = 90;
  final double size = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: MediaQuery.sizeOf(context).width / 1.7,
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xffF5F5F5),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text("Scooter ride", style: AppStyles.styleSemiBold16(context)),
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "The best solution to",
                            style: AppStyles.styleRegular10(context)
                                .copyWith(color: const Color(0xffB8B8B8)),
                          ),
                          Text(
                            "save your time",
                            style: AppStyles.styleRegular10(context)
                                .copyWith(color: const Color(0xffB8B8B8)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Image.asset(
                Assets.imagesScootercateg,
                height:
                    MediaQuery.orientationOf(context) == Orientation.landscape
                        ? 3 * height * (size)
                        : height * (size),
                width:
                    MediaQuery.orientationOf(context) == Orientation.landscape
                        ? 3 * height * (1.32)
                        : height * (1.32),
                fit: BoxFit.contain,
              )
            ],
          )
        ],
      ),
    );
  }
}
