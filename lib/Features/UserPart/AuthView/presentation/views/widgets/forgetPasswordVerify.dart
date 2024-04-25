import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/AuthQ.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/OTP_TextField.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/ResetPassword.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/SignUpAppBar.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/verifyHeader.dart';

class forgetPasswordVerify extends StatelessWidget {
  const forgetPasswordVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, title: "Forget password ", onPressed: () {
        Navigator.pop(context);
      }),
      body: Column(
        children: [
          const AuthHeader(
              firstHeader: "Forgot Password",
              secondHeader: "Code has been send to ***** ***98"),
          const SizedBox(height: 40),
          OTPTextField(verificationId: ""),
          const SizedBox(height: 20),
          const AuthQ(
              firstText: "Didn’t receive code? ", secondText: "Resend again"),
        ],
      ),
    );
  }
}
