import 'package:flutter/material.dart';
import 'package:yallanow/Features/Onboarding/presentation/views/onBoardingBody.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: onBoardingBody(),
      ),
    );
  }
}
