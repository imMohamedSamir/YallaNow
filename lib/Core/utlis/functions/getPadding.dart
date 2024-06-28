import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppLang.dart';

EdgeInsets getPadding(
    {required int index,
    required int lastIndex,
    required double paddingValue}) {
  if (AppLang.isArabic()) {
    return EdgeInsets.only(
        left: index == lastIndex ? 0 : paddingValue, right: 0);
  } else {
    return EdgeInsets.only(
        left: 0, right: index == lastIndex ? 0 : paddingValue);
  }
}
