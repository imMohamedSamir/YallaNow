import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/AuthOptions.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/AuthQ.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/DividerWidget.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/LoginForm.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/SignupView.dart';
import 'package:yallanow/generated/l10n.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text(S.of(context).SignIn, style: AppStyles.styleMedium24(context)),
            const SizedBox(height: 30),
            const LoginForm(),
            const SizedBox(height: 30),
            const DividersWidget(),
            const SizedBox(height: 20),
            const AuthOptions(),
            const SizedBox(height: 30),
            AuthQ(
              firstText: S.of(context).havntaccount,
              secondText: S.of(context).SignUp,
              onTap: () {
                NavigateToPage.slideFromLeftAndRemove(
                    context: context, page: const SignUpView());
              },
            )
          ],
        ),
      ),
    );
  }
}
