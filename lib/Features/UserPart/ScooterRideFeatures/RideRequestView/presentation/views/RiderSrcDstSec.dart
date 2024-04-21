import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/riderSrcDstCard.dart';

class RiderSrcDstSec extends StatelessWidget {
  const RiderSrcDstSec({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiderSrcDstCard(
          isSrc: true,
          dsc: 'Lorem ipsum dolor sit amet cesincidunt ',
        ),
        RiderSrcDstDivider(),
        RiderSrcDstCard(
          isSrc: false,
          dsc: 'Lorem ipsum dolor sit amet cesincidunt ',
        ),
      ],
    );
  }
}
