import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class OBdescription extends StatelessWidget {
  const OBdescription({super.key, required this.currentindex});
  final int currentindex;
  static const List<String> dsc = [
    "Discover new horizons",
    "Explore endless possibilities",
    "Unlock your potential",
    "Embark on a journey of self-discovery"
  ];
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
                text: dsc[currentindex],
                style: AppStyles.styleMedium14(context)
                    .copyWith(color: const Color(0xffA0A0A0))),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
//  "Choose your location to start discover services and scooter request around you"