import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class RideCateg extends StatelessWidget {
  const RideCateg({super.key});
  final double height = 90;
  final double size = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.getHeight(90, context),
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10, right: 16),
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
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Image.asset(
                Assets.imagesScootercateg,
                height: AppSizes.getHeight(80, context),
                width: AppSizes.getWidth(112, context),
                fit: BoxFit.contain,
              )
            ],
          )
        ],
      ),
    );
  }
}
