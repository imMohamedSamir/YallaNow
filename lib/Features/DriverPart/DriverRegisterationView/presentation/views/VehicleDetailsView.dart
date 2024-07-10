import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/views/VehicleDetailsViewBody.dart';
import 'package:yallanow/generated/l10n.dart';

class VehicleDetailsView extends StatelessWidget {
  const VehicleDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondAppBar(context, title: S.of(context).VehicleDetails),
      body: const VehicleDetailsViewBody(),
    );
  }
}
