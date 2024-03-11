import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/SignUpAppBar.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/verifyHeader.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  get appBar => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, title: "Forget password ", onPressed: () {
        Navigator.pop(context);
      }),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 30),
                    AuthHeader(
                        firstHeader: "Set New password",
                        secondHeader: "Set your new password"),
                    SizedBox(height: 40),
                    Column(
                      children: [
                        CustomTextField(
                          hintText: "Enter Your New Password",
                        ),
                        SizedBox(height: 20),
                        CustomTextField(hintText: "Confirm Password"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(
                text: " Save ",
                color: Colors.white,
                btncolor: Color(0xffB20404)),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
