import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/AuthQ.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/OTP_TextField.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/SignUpAppBar.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/verifyHeader.dart';

class ForgetPasswordVerify extends StatelessWidget {
  const ForgetPasswordVerify(
      {super.key, this.verificationId, this.endOfNumber});
  final String? verificationId;
  final String? endOfNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, title: "Forget password ", onPressed: () {
        Navigator.pop(context);
      }),
      body: Column(
        children: [
          AuthHeader(
              firstHeader: "Forgot Password",
              secondHeader: "Code has been send to ***** ***$endOfNumber"),
          const SizedBox(height: 40),
          OTPTextField(verificationId: verificationId!, isRest: true),
          const SizedBox(height: 20),
          const AuthQ(
              firstText: "Didn’t receive code? ", secondText: "Resend again"),
        ],
      ),
    );
  }
}
