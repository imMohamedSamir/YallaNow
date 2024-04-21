import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onPressed,
      required this.text,
      required this.txtcolor,
      required this.btncolor,
      this.isBasket = false});
  final void Function()? onPressed;
  final String text;
  final Color txtcolor;
  final Color btncolor;
  final bool isBasket;

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
                  side: BorderSide(
                      color:
                          isBasket ? Colors.white : const Color(0xffB20404))),
            ),
            backgroundColor: MaterialStatePropertyAll<Color>(btncolor)),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppStyles.styleMedium16(context).copyWith(color: txtcolor),
        ),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  const CustomButton2(
      {super.key,
      this.onPressed,
      // required this.text,
      required this.txtcolor,
      required this.btncolor,
      this.isBasket = false,
      this.child,
      this.text});
  final void Function()? onPressed;
  final Widget? child;
  final Color txtcolor;
  final Color btncolor;
  final bool isBasket;
  final String? text;
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
                  side: BorderSide(
                      color:
                          isBasket ? Colors.white : const Color(0xffB20404))),
            ),
            backgroundColor: MaterialStatePropertyAll<Color>(btncolor)),
        onPressed: onPressed,
        child: text == null
            ? child
            : Text(
                text!,
                style:
                    AppStyles.styleMedium16(context).copyWith(color: txtcolor),
              ),
      ),
    );
  }
}
