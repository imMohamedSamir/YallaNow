import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/functions/getCurrentLocation.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/SignUpAppBar.dart';

class GetLocationPage extends StatelessWidget {
  const GetLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, title: "Location", onPressed: () {
        Navigator.pop(context);
      }),
      body: Column(
        children: [
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 72),
            child: Image.asset(Assets.imagesMap1),
          ),
          const SizedBox(height: 90),
          const getLocationDSC(),
        ],
      ),
    );
  }
}

class getLocationDSC extends StatelessWidget {
  const getLocationDSC({
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
          CustomButton(
            text: "Use current location",
            color: Color(0xffFFFFFF),
            btncolor: Color(0xffB20404),
            onPressed: () {
              CurrentLocation().checkpermission();
            },
          ),
          const SizedBox(height: 16),
          const CustomButton(
              text: "Skip for now",
              color: Color(0xffB20404),
              btncolor: const Color(0xffFFFFFF))
        ],
      ),
    );
  }
}
