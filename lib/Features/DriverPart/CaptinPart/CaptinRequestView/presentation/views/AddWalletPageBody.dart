import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/generated/l10n.dart';

class AddWalletPageBody extends StatelessWidget {
  const AddWalletPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        child: Column(
          children: [
            const Gap(16),
            CustomTextField(
              hintText: "0.00",
              suffixIcon: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(S.of(context).EGP,
                    style: AppStyles.styleBold16(context)),
              ),
            ),
            const Gap(8),
            Text(
              S.of(context).CaptinwalletMsg,
              style: AppStyles.styleRegular14(context).copyWith(color: scColor),
            ),
            const Gap(16),
            Text("50 ${S.of(context).EGP}${S.of(context).CaptinwalletMsg2}",
                style: AppStyles.styleMedium16(context)
                    .copyWith(color: Colors.green)),
            const Spacer(),
            CustomButton(
                text: S.of(context).Submit,
                txtcolor: Colors.white,
                btncolor: pKcolor),
            const Gap(24),
          ],
        ),
      ),
    );
  }
}
