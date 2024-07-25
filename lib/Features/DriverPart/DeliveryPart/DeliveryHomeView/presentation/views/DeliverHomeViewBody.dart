import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';

class DeliverHomeViewBody extends StatelessWidget {
  const DeliverHomeViewBody({super.key});
  final bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          isActive
              ? const LinearProgressIndicator(color: pKcolor)
              : const SizedBox(),
          const Spacer(),
          Image.asset(
            Assets.imagesOB1,
            width: AppSizes.getWidth(350, context),
            height: AppSizes.getHeight(350, context),
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 12),
          Text(isActive ? "Searching for requests" : "Enable your location",
              style: AppStyles.styleMedium24(context)),
          const SizedBox(height: 12),
          isActive
              ? const SizedBox()
              : RichText(
                  text: TextSpan(
                      text:
                          "enable your location to get requests in your current area",
                      style: AppStyles.styleMedium14(context)),
                  textAlign: TextAlign.center,
                ),
          const SizedBox(height: 102),
        ],
      ),
    );
  }
}
