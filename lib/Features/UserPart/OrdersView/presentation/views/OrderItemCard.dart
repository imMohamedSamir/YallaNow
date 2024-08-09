import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/generated/l10n.dart';

class OrderItemCard extends StatelessWidget {
  const OrderItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: scColor.withOpacity(.15)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: scColor.withOpacity(.4)),
            child: Text("2",
                style: AppStyles.styleMedium14(context)
                    .copyWith(color: blackdcolor)),
          ),
          const Gap(16),
          SizedBox(
            width: AppSizes.getWidth(230, context),
            child: Text("burger", style: AppStyles.styleMedium16(context)),
          ),
          const Spacer(),
          Text("150 ${S.of(context).EGP}",
              style: AppStyles.styleMedium16(context)),
          const Gap(6),
        ],
      ),
    );
  }
}
