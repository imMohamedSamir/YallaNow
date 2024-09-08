import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryHomeView/presentation/DeliveryAppBar.dart';
import 'package:yallanow/generated/l10n.dart';

AppBar checkDeliveryAppBar(BuildContext context, {required int currnetpage}) {
  if (currnetpage == 0) {
    return deliveryAppBar(context: context);
  } else if (currnetpage == 1) {
    return secondHomeAppBar(context, title: S.of(context).Orders);
  } else {
    return secondHomeAppBar(context, title: "Rating");
  }
}
