import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/foodView/presentation/views/OrderDetails.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Order summary",
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff240301))),
        Column(
          children: List.generate(
              3,
              (index) => const Padding(
                    padding: EdgeInsets.only(bottom: 6.0),
                    child: OrderDetailsRow(
                        type: "1 x burger sandwich",
                        price: "EGP 400",
                        total: false),
                  )),
        ),
        const SizedBox(height: 0),
        const OrderDetailsRow(type: "Subtotal", price: "EGP 400", total: false),
        const SizedBox(height: 16),
        const OrderDetailsRow(
            type: "Delivery fee", price: "EGP 10.00", total: false),
        const SizedBox(height: 16),
        const OrderDetailsRow(
            type: "Service fee", price: "EGP 5.00", total: false),
        const SizedBox(height: 16),
        const OrderDetailsRow(
            type: "Total amount", price: "EGP 415.00", total: true)
      ],
    );
  }
}
