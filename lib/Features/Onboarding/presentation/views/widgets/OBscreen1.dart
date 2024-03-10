import 'package:flutter/material.dart';
import 'package:yallanow/Features/Onboarding/presentation/views/widgets/OBbuttons.dart';
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
  void dispose() {
    pageController.dispose();
    super.dispose();
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
        const Spacer(),
        OBbuttons(
            currentPageIndex: currentPageIndex, pageController: pageController),
        const SizedBox(height: 40),
      ],
    );
  }
}
