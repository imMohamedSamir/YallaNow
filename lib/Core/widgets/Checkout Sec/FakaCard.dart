import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/generated/l10n.dart';

class FakaCard extends StatelessWidget {
  const FakaCard({super.key, required this.change, this.isSelected = false});

  final int change;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.all(isSelected ? 18 : 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isSelected
              ? Colors.green.withOpacity(0.8)
              : Colors.grey.withOpacity(0.2),
        ),
        child: Row(
          children: [
            Text(change.toString(), style: AppStyles.styleRegular16(context)),
            const Gap(8),
            Text(S.of(context).EGP,
                style: AppStyles.styleRegular12(context)
                    .copyWith(color: blackdcolor)),
          ],
        ),
      ),
    );
  }
}
