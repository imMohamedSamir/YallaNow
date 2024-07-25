import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/views/DrSignUpForm.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/AuthQ.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/LoginView.dart';
import 'package:yallanow/generated/l10n.dart';

class DriverSignUpViewBody extends StatelessWidget {
  const DriverSignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text(S.of(context).SignUp, style: AppStyles.styleMedium24(context)),
            const SizedBox(height: 16),
            const DrSignUpForm(),
            const SizedBox(height: 30),
            AuthQ(
              firstText: S.of(context).already_have_account,
              secondText: S.of(context).SignIn,
              onTap: () {
                Navigator.pop(context);
                NavigateToPage.slideFromRight(
                    context: context, page: const LoginView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
