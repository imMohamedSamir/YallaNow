import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/AuthQ.dart';

class SignupTerms extends StatelessWidget {
  const SignupTerms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(74, context),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: AuthQ(
            firstText: "By registering, you agree to our",
            secondText: "  Terms and Conditions"),
      ),
    );
  }
}
