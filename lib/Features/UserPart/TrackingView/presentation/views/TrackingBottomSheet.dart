import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/TrackingView/presentation/views/DeliveryDetails.dart';
import 'package:yallanow/Features/UserPart/TrackingView/presentation/views/DeliveryPhaseSec.dart';
import 'package:yallanow/Features/UserPart/TrackingView/presentation/views/DeliveryTimeSec.dart';
import 'package:yallanow/Features/UserPart/TrackingView/presentation/views/ViewDetailsButton.dart';
import 'package:yallanow/generated/l10n.dart';

class TrackingBottomSheetSec extends StatelessWidget {
  const TrackingBottomSheetSec({
    super.key,
    required this.pageController,
    required this.page,
  });
  final PageController pageController;
  final int page;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      decoration: BoxDecoration(
          color: grayColor, borderRadius: BorderRadius.circular(24)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          const DeliveryTimeSec(),
          const SizedBox(height: 24),
          const DeliveryPhaseSec(),
          const SizedBox(height: 24),
          DeliveryDetails(pageController: pageController),
          const SizedBox(height: 24),
          // const ViewDetailsButton(),
          // const Spacer(),
          page > 0
              ? const SizedBox()
              : CustomButton(
                  isBasket: true,
                  text: S.of(context).Cancel,
                  txtcolor: pKcolor,
                  btncolor: Colors.white),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
