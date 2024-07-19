import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.firstHeader,
    required this.secondHeader,
  });
  final String firstHeader, secondHeader;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          firstHeader,
          style: AppStyles.styleMedium24(context),
        ),
        Text(
          secondHeader,
          style: AppStyles.styleRegular16(context)
              .copyWith(color: const Color(0xff9E9D9D)),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
