import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/PaymentMethodsTile.dart';

class PayMethodsSec extends StatelessWidget {
  const PayMethodsSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Pay with", style: AppStyles.styleSemiBold16(context)),
        const SizedBox(height: 16),
        const PaymentMethodsTile()
      ],
    );
  }
}
