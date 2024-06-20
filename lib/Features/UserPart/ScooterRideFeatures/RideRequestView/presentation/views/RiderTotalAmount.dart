import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class RideTotalAmount extends StatelessWidget {
  const RideTotalAmount({
    super.key,
    this.price,
  });
  final String? price;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Total amount ",
          style: AppStyles.styleMedium14(context),
        ),
        const Spacer(),
        Text(
          "$price EPG",
          style: AppStyles.styleMedium14(context),
        ),
      ],
    );
  }
}
