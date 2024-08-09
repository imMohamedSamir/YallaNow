import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/generated/l10n.dart';

class FakaCard extends StatelessWidget {
  const FakaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.withOpacity(0.2)),
      child: Row(
        children: [
          Text("10", style: AppStyles.styleRegular16(context)),
          const Gap(8),
          Text(S.of(context).EGP, style: AppStyles.styleRegular12(context)),
        ],
      ),
    );
  }
}
