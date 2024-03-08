import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/functions/OBtransitions.dart';
import 'package:yallanow/Core/utlis/functions/SkipMethod.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/Onboarding/presentation/views/widgets/OBdescription.dart';
import 'package:yallanow/Features/Onboarding/presentation/views/widgets/OBpageView.dart';
import 'package:yallanow/Features/Onboarding/presentation/views/widgets/bars.dart';

class onboardingscreen1 extends StatefulWidget {
  const onboardingscreen1({super.key});

  @override
  State<onboardingscreen1> createState() => _onboardingscreen1State();
}

class _onboardingscreen1State extends State<onboardingscreen1> {
  late PageController pageController;
  int currentPageIndex = 0;

  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPageIndex = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        bars(
          currentpage: currentPageIndex,
        ),
        const SizedBox(height: 54),
        OBpageView(pageController: pageController),
        const SizedBox(height: 35),
        OBdescription(
          currentindex: currentPageIndex,
        ),
        const SizedBox(height: 46),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomButton(
                onPressed: () {
                  OBtransitions(context, currentPageIndex, pageController);
                },
                text: currentPageIndex == 3 ? "Get started" : "Next",
                color: Colors.white,
                btncolor: const Color(0xffB20404),
              ),
              const SizedBox(height: 16),
              currentPageIndex == 3
                  ? const SizedBox()
                  : CustomButton(
                      onPressed: () {
                        SkipMethod(context);
                      },
                      text: "Skip",
                      color: const Color(0xffB20404),
                      btncolor: Colors.white),
            ],
          ),
        )
      ],
    );
  }
}
