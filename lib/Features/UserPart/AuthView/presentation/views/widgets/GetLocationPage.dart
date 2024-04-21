import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/CurrentLocationButtonBuilder.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/MainHomeView.dart';

class GetLocationPage extends StatelessWidget {
  const GetLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 72),
              child: Image.asset(Assets.imagesMap1),
            ),
            const SizedBox(height: 90),
            const GetLocationDSC(),
          ],
        ),
      ),
    );
  }
}

class GetLocationDSC extends StatelessWidget {
  const GetLocationDSC({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Enable your location", style: AppStyles.styleMedium24(context)),
          const SizedBox(height: 12),
          RichText(
            text: TextSpan(
                text:
                    "Choose your location to start discover services and scooter request around you",
                style: AppStyles.styleMedium14(context)
                    .copyWith(color: const Color(0xffA0A0A0))),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 46),
          const CurrentLocationButtonBuilder(),
          const SizedBox(height: 16),
          CustomButton(
            text: "Skip for now",
            txtcolor: pKcolor,
            btncolor: const Color(0xffFFFFFF),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MainHomeView()));
            },
          )
        ],
      ),
    );
  }
}
