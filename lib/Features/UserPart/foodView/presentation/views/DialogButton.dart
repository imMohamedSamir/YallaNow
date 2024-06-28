import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    super.key,
    required this.btnColor,
    required this.textColor,
    required this.text,
    this.onPressed,
  });
  final Color btnColor, textColor;
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ??
          () {
            Navigator.pop(context);
          },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color?>(btnColor),
        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        )),
      ),
      child: Center(
        child: Text(
          text,
          style: AppStyles.styleRegular16(context).copyWith(color: textColor),
        ),
      ),
    );
  }
}
