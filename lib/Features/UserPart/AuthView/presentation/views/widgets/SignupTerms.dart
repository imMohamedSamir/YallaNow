import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/AuthQ.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/PrivacyPolicyPage.dart';
import 'package:yallanow/generated/l10n.dart';

class SignupTerms extends StatelessWidget {
  const SignupTerms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigateToPage.slideFromBottom(
            context: context, page: const PrivacyPolicyPage());
      },
      child: SizedBox(
        height: AppSizes.getHeight(74, context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: AuthQ(
            firstText: S.of(context).Terms1,
            secondText: S.of(context).Terms2,
          ),
        ),
      ),
    );
  }
}
