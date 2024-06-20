import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryRequestView/presentation/views/DeliveryRequestBS.dart';

AppBar driverAppBar({required BuildContext context}) {
  return AppBar(
    centerTitle: true,
    title: const YallButton(),
    // leading: Builder(builder: (context) {
    //   return IconButton(
    //       onPressed: () {
    //         Scaffold.of(context).openDrawer();
    //       },
    //       icon: const Icon(Icons.list));
    // }),
  );
}

class YallButton extends StatelessWidget {
  const YallButton({
    super.key,
  });
  final bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(32),
      onTap: isActive
          ? () {
              // showModalBottomSheet(
              //   context: context,
              //   // isScrollControlled: true,

              //   builder: (context) {
              //     return const DeliveryRequestBS();
              //   },
              // );
            }
          : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 6),
        decoration: BoxDecoration(
            color: isActive ? pKcolor : scColor.withOpacity(0.6),
            borderRadius: BorderRadius.circular(32)),
        child: Text(
          "Yalla",
          style:
              AppStyles.styleSemiBold20(context).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
