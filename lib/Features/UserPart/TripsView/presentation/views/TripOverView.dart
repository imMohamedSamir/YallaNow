import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/generated/l10n.dart';

class TripOverView extends StatelessWidget {
  const TripOverView({super.key, required this.dsc});
  final String dsc;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).Overview,
              style: AppStyles.styleSemiBold18(context)),
          const Gap(6),
          Text(dsc,
              style: AppStyles.styleRegular16(context).copyWith(color: scColor))
        ],
      ),
    );
  }
}
