import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Features/UserPart/Onboarding/presentation/views/widgets/OBbuttons.dart';
import 'package:yallanow/Features/UserPart/Onboarding/presentation/views/widgets/OBpageView.dart';
import 'package:yallanow/Features/UserPart/Onboarding/presentation/views/widgets/bars.dart';

class Onboardingscreen1 extends StatefulWidget {
  const Onboardingscreen1({super.key});

  @override
  State<Onboardingscreen1> createState() => _Onboardingscreen1State();
}

class _Onboardingscreen1State extends State<Onboardingscreen1> {
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
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OBpageView(pageController: pageController),
        Positioned(
            top: AppSizes.getHeight(65, context),
            child: bars(currentpage: currentPageIndex)),
        Positioned(
          bottom: 16,
          child: OBbuttons(
              currentPageIndex: currentPageIndex,
              pageController: pageController),
        ),
      ],
    );
  }
}
