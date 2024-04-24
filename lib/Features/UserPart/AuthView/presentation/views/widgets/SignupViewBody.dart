import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/AuthOptions.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/AuthQ.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/ChooseRole.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/DividerWidget.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/LoginView.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/SignUpForm.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 30),
          Text("Sign up", style: AppStyles.styleMedium24(context)),
          const SizedBox(height: 30),
          const SignupForm(),
          const SizedBox(height: 29),
          const dividersWidget(),
          const SizedBox(height: 20),
          const AuthOptions(),
          const SizedBox(height: 30),
          AuthQ(
            firstText: "Already have an account?",
            secondText: " Sign in",
            onTap: () {
              Navigator.pop(context);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginView()));
            },
          ),
          const SizedBox(height: 30),
          const ChooseRole(),
          const SizedBox(height: 18),
        ]),
      ),
    );
  }
}
