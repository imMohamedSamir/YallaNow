import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class signinQ extends StatelessWidget {
  const signinQ({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: "Already have an account?",
                style: AppStyles.styleRegular14(context)
                    .copyWith(color: const Color(0xff5A5A5A))),
            TextSpan(text: "Sign in", style: AppStyles.styleSemiBold14(context))
          ],
        ),
      ),
    );
  }
}
