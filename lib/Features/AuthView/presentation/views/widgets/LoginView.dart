import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/AuthOptions.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/AuthQ.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/DividerWidget.dart';

import 'package:yallanow/Features/AuthView/presentation/views/widgets/LoginForm.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/SignUpAppBar.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, title: "Sign in", onPressed: () {
        Navigator.pop(context);
      }),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text("Sign in", style: AppStyles.styleMedium24(context)),
              const SizedBox(height: 30),
              const LoginForm(),
              const SizedBox(height: 30),
              const dividersWidget(),
              const SizedBox(height: 20),
              const AuthOptions(),
              const SizedBox(height: 30),
              const AuthQ(
                  firstText: "Didn't have an account? ", secondText: "Sign up")
            ],
          ),
        ),
      ),
    );
  }
}
