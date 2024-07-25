import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';

abstract class ScaffoldMsgMethod {
  static void showMsg(BuildContext context,
      {required String msg, bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 1),
        backgroundColor: isError ? pKcolor : Colors.green,
        content: Text(
          msg,
          style: AppStyles.styleMedium16(context).copyWith(color: Colors.white),
        )));
  }
}
