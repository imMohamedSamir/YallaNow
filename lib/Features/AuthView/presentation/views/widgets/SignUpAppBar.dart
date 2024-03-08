import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/Onboarding/presentation/onboarding.dart';

AppBar SignUpAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    titleSpacing: -8,
    title: Text("Create account", style: AppStyles.styleRegular16(context)),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnBoarding()),
        );
      },
    ),
  );
}
