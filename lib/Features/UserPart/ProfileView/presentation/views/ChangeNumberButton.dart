import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/generated/l10n.dart';

class ChangeNumberButton extends StatelessWidget {
  const ChangeNumberButton({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(S.of(context).change,
          style: AppStyles.styleMedium14(context).copyWith(color: pKcolor)),
    );
  }
}
