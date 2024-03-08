import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/AuthOptions.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/DividerWidget.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/GenderDropMenu.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/SignInQ.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/SignUpAppBar.dart';

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
            const CustomTextField(
                hintText: "Name", textInputAction: TextInputAction.next),
            const SizedBox(height: 16),
            const CustomTextField(
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next),
            const SizedBox(height: 16),
            const CustomTextField(
              hintText: "Mobile number",
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            const Genderdropmenu(),
            const SizedBox(height: 30),
            const CustomButton(
                text: "Sign Up",
                color: Colors.white,
                btncolor: Color(0xffB20404)),
            const SizedBox(height: 29),
            const dividersWidget(),
            const SizedBox(height: 20),
            const AuthOptions(),
            const SizedBox(height: 30),
            const signinQ(),
            const SizedBox(height: 50),
          ]),
        ),
      ),
    );
  }
}
