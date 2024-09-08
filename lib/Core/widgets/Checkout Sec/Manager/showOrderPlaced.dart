import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/TrackingView/presentation/TrackingView.dart';
import 'package:yallanow/generated/l10n.dart';

void showOrderPlaced(BuildContext context) {
  showModalBottomSheet(
    isDismissible: true,
    context: context,
    builder: (context) {
      return Column(
        children: [
          Image.asset(
            Assets.imagesOrderPlaced,
            height: AppSizes.getHeight(260, context),
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 8),
          Text(
            S.of(context).OrderPlaced,
            style: AppStyles.styleSemiBold20(context),
          ),
          const SizedBox(height: 6),
          Text(
            S.of(context).OrderPlacedMsg,
            style: AppStyles.styleRegular16(context)
                .copyWith(color: const Color(0xff5A5A5A)),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TrackinView(),
                      ));
                },
                text: S.of(context).TrackOrder,
                txtcolor: Colors.white,
                btncolor: pKcolor),
          ),
          const SizedBox(height: 12),
        ],
      );
    },
  );
}
