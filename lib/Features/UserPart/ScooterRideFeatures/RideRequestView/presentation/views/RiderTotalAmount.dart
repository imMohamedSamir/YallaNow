import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class RideTotalAmount extends StatelessWidget {
  const RideTotalAmount({
    super.key,
  });

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
          "EGP 415.00",
          style: AppStyles.styleMedium14(context),
        ),
      ],
    );
  }
}
