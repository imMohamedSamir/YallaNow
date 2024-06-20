import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/RidePaymentBody.dart';
import 'package:yallanow/generated/l10n.dart';

class RidePaymentView extends StatelessWidget {
  const RidePaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondAppBar(context, title: S.of(context).RidePayment),
      body: const RidePaymentBody(),
    );
  }
}
