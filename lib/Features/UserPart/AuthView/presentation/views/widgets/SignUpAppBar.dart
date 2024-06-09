import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

AppBar customAppBar(BuildContext context,
    {required String title, required void Function()? onPressed}) {
  return AppBar(
    // shadowColor: Colors.green,
    titleSpacing: -8,
    title: Text(title, style: AppStyles.styleRegular16(context)),
    leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios), onPressed: onPressed),
  );
}

AppBar basketCustomAppBar(BuildContext context,
    {required String title, required void Function()? onPressed}) {
  return AppBar(
    backgroundColor: Colors.white,
    shadowColor: Colors.grey[200],
    elevation: 1,
    titleSpacing: -8,
    title: Text(title, style: AppStyles.styleMedium18(context)),
    leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios), onPressed: onPressed),
  );
}
