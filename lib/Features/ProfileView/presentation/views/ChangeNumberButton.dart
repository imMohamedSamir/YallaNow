import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

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
      child: Text("Change",
          style: AppStyles.styleMedium12(context)
              .copyWith(color: const Color(0xffB20404))),
    );
  }
}
