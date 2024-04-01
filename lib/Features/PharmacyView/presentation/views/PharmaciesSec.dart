import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/PharmacyView/presentation/views/PharmaciesLV.dart';

class PharmaciesSec extends StatelessWidget {
  const PharmaciesSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Pharmacies", style: AppStyles.styleMedium16(context)),
        const SizedBox(height: 24),
        const PharmaciesLV()
      ],
    );
  }
}
