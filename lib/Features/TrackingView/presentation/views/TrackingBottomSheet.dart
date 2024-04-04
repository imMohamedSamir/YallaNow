import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/TrackingView/presentation/views/DeliveryDetails.dart';
import 'package:yallanow/Features/TrackingView/presentation/views/DeliveryPhaseSec.dart';
import 'package:yallanow/Features/TrackingView/presentation/views/DeliveryTimeSec.dart';
import 'package:yallanow/Features/TrackingView/presentation/views/ViewDetailsButton.dart';

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
      height: AppSizes.getHeight(456, context),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Container(
              height: AppSizes.getHeight(3, context),
              width: AppSizes.getWidth(38, context),
              color: const Color(0xffE0E0E0)),
          const SizedBox(height: 20),
          const DeliveryTimeSec(),
          const SizedBox(height: 24),
          const DeliveryPhaseSec(),
          const SizedBox(height: 24),
          DeliveryDetails(pageController: pageController),
          const SizedBox(height: 24),
          const ViewDetailsButton(),
          const Spacer(),
          page > 0
              ? const SizedBox()
              : const CustomButton(
                  isBasket: true,
                  text: "Cancel",
                  txtcolor: Color(0xffB20404),
                  btncolor: Colors.white),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
