import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/AvailableRideLV.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/AvailableRidePayMethod.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/ScooterButtonBuilder.dart';

class AvailableRideBS extends StatelessWidget {
  const AvailableRideBS({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.getHeight(580, context),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Choose a ride',
              style: AppStyles.styleSemiBold20(context)
                  .copyWith(color: const Color(0xff2A2A2A))),
          const SizedBox(height: 16.0),
          const AvailableRideLV(),
          const SizedBox(height: 16),
          const AvailableRidePayMethod(),
          const SizedBox(height: 16),
          const ScooterButtonBuilder()
        ],
      ),
    );
  }
}

void AvailableRideBSmethod(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    showDragHandle: true,
    enableDrag: true,
    context: context,
    builder: (BuildContext context) {
      return const AvailableRideBS();
    },
  );
}
