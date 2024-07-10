import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/views/DriverDetailsForm.dart';
import 'package:yallanow/generated/l10n.dart';

class DriverDetailsViewBody extends StatelessWidget {
  const DriverDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(S.of(context).DriverAndVehicle,
                style: AppStyles.styleMedium18(context)),
            const SizedBox(height: 16),
            const DriverDetailsForm(),
          ],
        ),
      ),
    );
  }
}
