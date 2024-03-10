import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class OTP_TextField extends StatelessWidget {
  const OTP_TextField({super.key, this.onCompleted});
  final void Function(String)? onCompleted;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Pinput(
        length: 5,
        defaultPinTheme: PinTheme(
            textStyle: AppStyles.styleMedium16(context),
            margin: const EdgeInsets.only(left: 8),
            width: 50,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xff9E9D9D)),
            )),
        focusedPinTheme: PinTheme(
            textStyle: AppStyles.styleMedium16(context),
            margin: const EdgeInsets.only(left: 8),
            width: 55,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 2, color: const Color(0xffB20404)),
            )),
        onCompleted: onCompleted,
      ),
    );
  }
}
