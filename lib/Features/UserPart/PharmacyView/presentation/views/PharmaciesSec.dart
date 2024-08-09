import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmaciesLV.dart';
import 'package:yallanow/generated/l10n.dart';

class PharmaciesSec extends StatelessWidget {
  const PharmaciesSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).Pharamcies, style: AppStyles.styleMedium16(context)),
        const SizedBox(height: 24),
        const PharmaciesLV()
      ],
    );
  }
}
