import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyHealthGV.dart';

class PharmacyHealthSec extends StatelessWidget {
  const PharmacyHealthSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Health", style: AppStyles.styleMedium16(context)),
        const SizedBox(height: 16),
        const PharmacyHealthGV()
      ],
    );
  }
}
