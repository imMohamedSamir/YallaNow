import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

AppBar CustomAppBar(BuildContext context,
    {required String title, required void Function()? onPressed}) {
  return AppBar(
    elevation: 0,
    titleSpacing: -8,
    title: Text(title, style: AppStyles.styleRegular16(context)),
    leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios), onPressed: onPressed),
  );
}
