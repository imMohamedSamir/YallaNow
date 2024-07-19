import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/ExternalAuthForm.dart';
import 'package:yallanow/generated/l10n.dart';

class ExternalAuthPageBody extends StatelessWidget {
  const ExternalAuthPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(16),
          Text(S.of(context).SignUp, style: AppStyles.styleMedium24(context)),
          const Gap(8),
          Text(S.of(context).SignUpMsg,
              style: AppStyles.styleRegular16(context)),
          const Gap(16),
          const ExternalAuthForm()
        ],
      ),
    );
  }
}
