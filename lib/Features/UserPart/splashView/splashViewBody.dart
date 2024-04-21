import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/LoginView.dart';
import 'package:yallanow/Features/UserPart/Onboarding/presentation/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/MainHomeView.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  bool? isFirstTime;
  String? token;
  @override
  void initState() {
    checkFirstTimeUser();
    navigateTransition();
    super.initState();
  }

  void checkFirstTimeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirstTime = prefs.getBool('isFirstTime') ?? true;
    if (isFirstTime!) {
      await prefs.setBool('isFirstTime', false);
    }
    token = prefs.getString("token");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void navigateTransition() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (_, __, ___) => isFirstTime!
              ? const OnBoarding()
              : token != null
                  ? const MainHomeView()
                  : const LoginView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(Assets.imagesSplashLogo));
  }
}
