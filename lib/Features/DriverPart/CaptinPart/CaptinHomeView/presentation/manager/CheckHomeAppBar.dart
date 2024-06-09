import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryHomeView/presentation/driverAppBar.dart';

AppBar checkAppBar(BuildContext context, {required int currnetpage}) {
  if (currnetpage == 0) {
    return driverAppBar(context: context);
  } else if (currnetpage == 1) {
    return secondHomeAppBar(context, title: "History");
  } else {
    return secondHomeAppBar(context, title: "Rating");
  }
}
