import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/views/OrderDetailsRow.dart';
import 'package:yallanow/generated/l10n.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketManagerCubit, BasketManagerState>(
      builder: (context, state) {
        if (state is BasketManagerChange) {
          if (state.items.isEmpty) {
            return const SizedBox();
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.of(context).PaymentSummary,
                    style: AppStyles.styleSemiBold16(context)
                        .copyWith(color: const Color(0xff240301))),
                const SizedBox(height: 16),
                OrderDetailsRow(
                    type: "Subtotal",
                    price: "${state.totalPrice} ${S.of(context).EGP}",
                    total: false),
                const SizedBox(height: 16),
                OrderDetailsRow(
                    type: S.of(context).DeliveryFee,
                    price: "10.00 ${S.of(context).EGP}",
                    total: false),
                const SizedBox(height: 16),
                OrderDetailsRow(
                    type: S.of(context).ServiceFee,
                    price: "5.00 ${S.of(context).EGP}",
                    total: false),
                const SizedBox(height: 16),
                OrderDetailsRow(
                    type: "Total amount",
                    price: "${state.priceDetails} ${S.of(context).EGP}",
                    total: true)
              ],
            );
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
