import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/RidePaymentBody.dart';

class RidePaymentView extends StatelessWidget {
  const RidePaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondAppBar(context, title: "Ride Payment"),
      body: const RidePaymentBody(),
    );
  }
}
