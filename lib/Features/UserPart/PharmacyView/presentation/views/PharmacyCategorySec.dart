import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyCategoryLV.dart';
import 'package:yallanow/generated/l10n.dart';

class PharmacyCategorySec extends StatelessWidget {
  const PharmacyCategorySec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).Categories, style: AppStyles.styleMedium16(context)),
        const SizedBox(height: 16),
        const PharmacyCategoryLV()
      ],
    );
  }
}
