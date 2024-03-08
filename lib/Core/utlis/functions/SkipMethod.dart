import 'package:flutter/material.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/SignupView.dart';

void SkipMethod(BuildContext context) {
  Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (_, __, ___) => const SignUpView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ));
}
