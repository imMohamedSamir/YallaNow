import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/homeView/presentation/views/LocationAppBar.dart';
import 'package:yallanow/main.dart';

AppBar MainAppBar(
  BuildContext context, {
  required String title,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    titleSpacing: 16,
    title: Text(title, style: AppStyles.styleMedium18(context)),
    // leading: IconButton(
    //     icon: const Icon(Icons.arrow_back_ios),
    //     onPressed: () {
    //       Navigator.pop(context);
    //     })
  );
}

AppBar HomeAppBar() {
  return AppBar(
    elevation: 0,
    automaticallyImplyLeading: false,
    title: const LocationAppBar(),
  );
}

AppBar CategoryAppBar(BuildContext context, {required String title}) {
  return AppBar(
    title: Text(title, style: AppStyles.styleRegular16(context)),
    leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          Navigator.pop(context);
        }),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, routesNames.basket);
        },
        icon: const Badge(
          label: Text("0"),
          child: Icon(
            Icons.shopping_cart_outlined,
            color: Color(0xff240301),
          ),
        ),
      )
    ],
  );
}
