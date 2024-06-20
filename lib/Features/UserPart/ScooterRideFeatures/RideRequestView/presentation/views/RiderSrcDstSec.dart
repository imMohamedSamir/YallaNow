import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/riderSrcDstCard.dart';

class RiderSrcDstSec extends StatelessWidget {
  const RiderSrcDstSec({
    super.key,
    this.src,
    this.dst,
  });
  final String? src, dst;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiderSrcDstCard(
          isSrc: true,
          dsc: src ?? "",
        ),
        const RiderSrcDstDivider(),
        RiderSrcDstCard(
          isSrc: false,
          dsc: dst ?? "",
        ),
      ],
    );
  }
}
