import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/generated/l10n.dart';

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
        Text(S.of(context).Totalamount,
            style: AppStyles.styleMedium16(context)),
        const Spacer(),
        Text("$price EPG", style: AppStyles.styleMedium16(context)),
      ],
    );
  }
}
