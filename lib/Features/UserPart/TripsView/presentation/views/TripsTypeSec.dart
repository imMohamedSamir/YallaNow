import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripsTypesLV.dart';
import 'package:yallanow/generated/l10n.dart';

class TripsTypeSec extends StatelessWidget {
  const TripsTypeSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).TripsType, style: AppStyles.styleMedium16(context)),
        const Gap(16),
        const TripsTypesLV()
      ],
    );
  }
}
