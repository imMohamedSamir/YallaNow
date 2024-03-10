import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class forgetPasswordSec extends StatelessWidget {
  const forgetPasswordSec({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        "Forget password?",
        style: AppStyles.styleMedium14(context)
            .copyWith(color: const Color(0xffB20404)),
      ),
    );
  }
}
