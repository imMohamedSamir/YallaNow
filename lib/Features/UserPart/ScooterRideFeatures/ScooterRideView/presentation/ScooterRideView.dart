import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/views/ScooterRideViewBody.dart';

class ScooterRideView extends StatelessWidget {
  const ScooterRideView({super.key, this.fromHome = false});
  final bool fromHome;

  @override
  Widget build(BuildContext context) {
    return ScooterRideViewBody(fromHome: fromHome);
  }
}
