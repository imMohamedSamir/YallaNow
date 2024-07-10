import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/AvailableRideLV.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/AvailableRidePayMethod.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/ScooterButtonBuilder.dart';
import 'package:yallanow/generated/l10n.dart';

class AvailableRideBS extends StatelessWidget {
  const AvailableRideBS({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).Choosearide,
            style: AppStyles.styleSemiBold20(context)
                .copyWith(color: const Color(0xff2A2A2A))),
        const SizedBox(height: 16.0),
        const AvailableRideLV(),
        const SizedBox(height: 16),
        const AvailableRidePayMethod(),
        const SizedBox(height: 16),
        const ScooterButtonBuilder()
      ],
    );
  }
}
