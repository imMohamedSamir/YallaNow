import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/AuthOptions.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/DividerWidget.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/SignUpQ.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/SignUpAppBar.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/SignUpForm.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SignUpAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 30),
            Text("Sign up", style: AppStyles.styleMedium24(context)),
            const SizedBox(height: 30),
            const SignupForm(),
            const SizedBox(height: 29),
            const dividersWidget(),
            const SizedBox(height: 20),
            const AuthOptions(),
            const SizedBox(height: 30),
            const SignUpQ(),
            const SizedBox(height: 50),
          ]),
        ),
      ),
    );
  }
}
