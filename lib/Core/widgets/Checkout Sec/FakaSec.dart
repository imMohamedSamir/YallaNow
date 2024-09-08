import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/FakaTypes.dart';
import 'package:yallanow/Core/widgets/OptionalCustomWidget.dart';
import 'package:yallanow/generated/l10n.dart';

class FakaSec extends StatelessWidget {
  const FakaSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(S.of(context).Faka, style: AppStyles.styleMedium16(context)),
            const Spacer(),
            const OptionalCustomWidget()
          ],
        ),
        Text(S.of(context).FakaMsg,
            style: AppStyles.styleRegular14(context).copyWith(color: scColor)),
        const Gap(16),
        const FakaTypes()
      ],
    );
  }
}
