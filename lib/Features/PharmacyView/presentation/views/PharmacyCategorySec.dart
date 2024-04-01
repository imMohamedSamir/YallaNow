import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/PharmacyView/presentation/views/PharmacyCategoryLV.dart';

class PharmacyCategorySec extends StatelessWidget {
  const PharmacyCategorySec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Categories", style: AppStyles.styleMedium16(context)),
        const SizedBox(height: 16),
        const PharmacyCategoryLV()
      ],
    );
  }
}
