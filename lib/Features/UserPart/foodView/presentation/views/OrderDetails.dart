import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Payment summary",
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff240301))),
        const SizedBox(height: 16),
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

class OrderDetailsRow extends StatelessWidget {
  const OrderDetailsRow({
    super.key,
    required this.type,
    required this.price,
    required this.total,
  });
  final String type, price;
  final bool total;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          type,
          style: total
              ? AppStyles.styleMedium14(context)
                  .copyWith(color: const Color(0xff5A5A5A))
              : AppStyles.styleRegular14(context)
                  .copyWith(color: const Color(0xff5A5A5A)),
        ),
        const Spacer(),
        Text(
          price,
          style: total
              ? AppStyles.styleMedium14(context)
                  .copyWith(color: const Color(0xff5A5A5A))
              : AppStyles.styleRegular14(context)
                  .copyWith(color: const Color(0xff5A5A5A)),
        ),
      ],
    );
  }
}
