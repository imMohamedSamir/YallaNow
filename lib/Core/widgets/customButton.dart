import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onPressed,
      required this.text,
      required this.color,
      required this.btncolor});
  final void Function()? onPressed;
  final String text;
  final Color color;
  final Color btncolor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(
                      color: Color(0xffB20404)) // Set the border radius here
                  ),
            ),
            backgroundColor: MaterialStatePropertyAll<Color>(btncolor)),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppStyles.styleMedium16(context).copyWith(color: color),
        ),
      ),
    );
  }
}
