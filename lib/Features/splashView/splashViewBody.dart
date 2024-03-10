import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/Onboarding/presentation/onboarding.dart';

class splashViewBody extends StatefulWidget {
  const splashViewBody({super.key});

  @override
  State<splashViewBody> createState() => _splashViewBodyState();
}

class _splashViewBodyState extends State<splashViewBody> {
  @override
  void initState() {
    navigateTransition();
    super.initState();
  }

  void navigateTransition() {
    Future.delayed(const Duration(milliseconds: 3), () {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 900),
            pageBuilder: (_, __, ___) => const OnBoarding(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(Assets.imagesMainlogo2));
  }
}
