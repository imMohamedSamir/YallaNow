import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/views/DriverSignUpViewBody.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/SignupTerms.dart';
import 'package:yallanow/generated/l10n.dart';

class DriverSignUpView extends StatelessWidget {
  const DriverSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(context, title: S.of(context).CreateAccount),
      body: const DriverSignUpViewBody(),
      bottomNavigationBar: const SignupTerms(),
    );
  }
}
