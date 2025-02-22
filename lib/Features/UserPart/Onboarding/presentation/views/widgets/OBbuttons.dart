import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/functions/OBtransitions.dart';
import 'package:yallanow/Core/utlis/functions/SkipMethod.dart';
import 'package:yallanow/Core/widgets/customButton.dart';

class OBbuttons extends StatelessWidget {
  const OBbuttons({
    super.key,
    required this.currentPageIndex,
    required this.pageController,
  });

  final int currentPageIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            width: AppSizes.getWidth(361, context),
            child: CustomButton(
              onPressed: () {
                OBtransitions(context, currentPageIndex, pageController);
              },
              text: currentPageIndex == 3 ? "Yalla" : "Next",
              txtcolor: Colors.white,
              btncolor: const Color(0xffB20404),
            ),
          ),
          const SizedBox(height: 16),
          currentPageIndex == 3
              ? const SizedBox()
              : SizedBox(
                  width: 361,
                  child: CustomButton(
                      onPressed: () {
                        SkipMethod(context);
                      },
                      text: "Skip",
                      txtcolor: const Color(0xffB20404),
                      btncolor: Colors.white),
                ),
        ],
      ),
    );
  }
}
