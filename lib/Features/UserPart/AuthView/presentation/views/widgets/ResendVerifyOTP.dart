import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class ResendVerifyOTP extends StatelessWidget {
  const ResendVerifyOTP({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        // onTap: () => print("done"),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: "Didn’t receive code?",
                  style: AppStyles.styleMedium16(context)
                      .copyWith(color: const Color(0xff5A5A5A))),
              TextSpan(
                  text: " Resend again",
                  style: AppStyles.styleMedium16(context)
                      .copyWith(color: const Color(0xffB20404)))
            ],
          ),
        ),
      ),
    );
  }
}
