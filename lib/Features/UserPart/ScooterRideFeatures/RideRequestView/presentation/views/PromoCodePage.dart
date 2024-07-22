import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/PromoCodePageBody.dart';
import 'package:yallanow/generated/l10n.dart';

class PromoCodePage extends StatelessWidget {
  const PromoCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondAppBar(context, title: S.of(context).PromoCode),
      body: const PromoCodePageBody(),
      resizeToAvoidBottomInset: true,
    );
  }
}
