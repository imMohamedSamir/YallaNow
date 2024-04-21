import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/views/RecentplacesView.dart';

class RecentPlacesSec extends StatelessWidget {
  const RecentPlacesSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Recent places",
            style: AppStyles.styleMedium16(context)
                .copyWith(color: const Color(0xff5A5A5A))),
        const SizedBox(height: 16),
        const RecentplacesView()
      ],
    );
  }
}
