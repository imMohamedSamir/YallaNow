import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/ForgetPasswordPage.dart';
import 'package:yallanow/generated/l10n.dart';

class ForgetPasswordSec extends StatelessWidget {
  const ForgetPasswordSec({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigateToPage.slideFromRight(
            context: context, page: const ForgetPasswordPage());
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          S.of(context).passForget,
          style: AppStyles.styleMedium14(context).copyWith(color: pKcolor),
        ),
      ),
    );
  }
}
