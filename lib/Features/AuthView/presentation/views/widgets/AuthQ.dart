import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class AuthQ extends StatelessWidget {
  const AuthQ({
    super.key,
    required this.firstText,
    required this.secondText,
    this.onTap,
  });
  final String firstText, secondText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.center,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: firstText,
                  style: AppStyles.styleRegular14(context)
                      .copyWith(color: const Color(0xff5A5A5A))),
              TextSpan(
                  text: secondText, style: AppStyles.styleSemiBold14(context))
            ],
          ),
        ),
      ),
    );
  }
}
