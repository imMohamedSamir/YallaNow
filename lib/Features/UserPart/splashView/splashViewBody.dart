import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif/gif.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/TokenManger.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/CaptinHomeView.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryHomeView/presentation/DeliveryHomeView.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/LoginView.dart';
import 'package:yallanow/Features/UserPart/Onboarding/presentation/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/scooter_location_cubit/scooter_location_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/MainHomeView.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  bool? isFirstTime;
  String? userToken, userRole;
  late final GifController controller1;

  @override
  void initState() {
    controller1 = GifController(vsync: this);
    checkFirstTimeUser();
    super.initState();
  }

  void checkFirstTimeUser() async {
    BlocProvider.of<ScooterLocationCubit>(context).getMyCurrentPosition();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime!) {
      await prefs.setBool('isFirstTime', false);
    }
    userToken = await TokenManager.getUserToken();
    userRole = await TokenManager.getUserRole();
    navigateTransition();
  }

  void navigateTransition() {
    controller1.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        final Widget page = getPage();
        if (mounted) {
          NavigateToPage.slideFromRightandRemove(context: context, page: page);
        }
      }
    });
  }

  Widget getPage() {
    if (isFirstTime!) {
      return const OnBoarding();
    } else {
      if (userToken != null && !TokenManager.tokenIsExp(userToken)) {
        if (userRole == "Driver") {
          return const CaptinHomeView();
        } else if (userRole == "User") {
          return const MainHomeView();
        } else {
          return const DeliverHomeView();
        }
      } else {
        return const LoginView();
      }
    }
  }

  @override
  void dispose() {
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Gif(
      controller: controller1,
      fps: 30,
      image: const AssetImage(Assets.imagesLogoGif),
      placeholder: (context) {
        return Center(
            child: Image.asset(
          Assets.imagesYallaNowLogoWhite,
          height: AppSizes.getHeight(350, context),
          width: AppSizes.getWidth(350, context),
          filterQuality: FilterQuality.high,
          fit: BoxFit.contain,
        ));
      },
      onFetchCompleted: () {
        controller1.reset();
        controller1.forward();
      },
      height: double.infinity,
      fit: BoxFit.fill,
      autostart: Autostart.no,
    );
  }
}
