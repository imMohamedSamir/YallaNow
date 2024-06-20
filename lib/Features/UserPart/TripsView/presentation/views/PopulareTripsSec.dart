import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripsPopularSec.dart';
import 'package:yallanow/generated/l10n.dart';

class PopulareTripsSec extends StatelessWidget {
  const PopulareTripsSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).PopularTrips,
            style: AppStyles.styleMedium16(context)),
        const Gap(16),
        const TripsPopularSec()
      ],
    );
  }
}
