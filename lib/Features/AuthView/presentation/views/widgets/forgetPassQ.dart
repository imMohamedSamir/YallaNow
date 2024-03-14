import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/ForgetPasswordEP.dart';

class forgetPasswordSec extends StatelessWidget {
  const forgetPasswordSec({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ForgetPasswordPage()));
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          "Forget password?",
          style: AppStyles.styleMedium14(context)
              .copyWith(color: const Color(0xffB20404)),
        ),
      ),
    );
  }
}
