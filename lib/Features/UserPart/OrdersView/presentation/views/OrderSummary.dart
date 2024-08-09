import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/views/OrderDetailsRow.dart';
import 'package:yallanow/Features/UserPart/OrdersView/presentation/views/OrderItemCard.dart';
import 'package:yallanow/generated/l10n.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).OrderSummary,
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff240301))),
        const SizedBox(height: 16),
        Column(
          children: List.generate(
              3,
              (index) => const Padding(
                    padding: EdgeInsets.only(bottom: 6.0),
                    child: OrderItemCard(),
                  )),
        ),
        const SizedBox(height: 16),
        OrderDetailsRow(
            type: "Subtotal", price: " 400 ${S.of(context).EGP}", total: false),
        const SizedBox(height: 16),
        OrderDetailsRow(
            type: S.of(context).DeliveryFee,
            price: " 10.00 ${S.of(context).EGP}",
            total: false),
        const SizedBox(height: 16),
        OrderDetailsRow(
            type: S.of(context).ServiceFee,
            price: " 5.00 ${S.of(context).EGP}",
            total: false),
        const SizedBox(height: 16),
        OrderDetailsRow(
            type: S.of(context).Totalamount,
            price: " 415.00 ${S.of(context).EGP}",
            total: true),
        const SizedBox(height: 16),
      ],
    );
  }
}
