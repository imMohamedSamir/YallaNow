import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/OTP_TextField.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/ResendVerifyOTP.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/SignUpAppBar.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/setPassword.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/verifyHeader.dart';

class VerificationSignUp extends StatelessWidget {
  const VerificationSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, title: "Verify", onPressed: () {
        Navigator.pop(context);
      }),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const SizedBox(height: 32),
        const AuthHeader(
          firstHeader: "Phone verification",
          secondHeader: "Enter your OTP code",
        ),
        const SizedBox(height: 40),
        OTP_TextField(
          onCompleted: (value) {
            if (value == "12345") {
              showOtpVerificationDialog(context);
            }
          },
        ),
        const SizedBox(height: 20),
        const ResendVerifyOTP(),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomButton(
            text: "Verify ",
            txtcolor: Colors.white,
            btncolor: const Color(0xffB20404),
            onPressed: () {},
          ),
        ),
        const SizedBox(height: 24),
      ]),
    );
  }
}

void showOtpVerificationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.of(context).pop();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SetPassword()));
      });

      return const Center(
          child: CircularProgressIndicator(
        color: Color(0xffB20404),
      ));
    },
  );
}
