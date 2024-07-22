import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/generated/l10n.dart';

class PromoCodePageBody extends StatelessWidget {
  const PromoCodePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Text(S.of(context).enterPromoCode,
                style: AppStyles.styleMedium18(context)),
            const Gap(16),
            CustomTextField(hintText: S.of(context).PromoCode),
            const Spacer(),
            CustomButton(
                text: S.of(context).Submit,
                txtcolor: Colors.white,
                btncolor: pKcolor),
            const Gap(16),
          ],
        ),
      ),
    );
  }
}
