import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/views/OrderDetailsRow.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketManagerCubit, BasketManagerState>(
      builder: (context, state) {
        if (state is BasketManagerAdd) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Payment summary",
                  style: AppStyles.styleSemiBold16(context)
                      .copyWith(color: const Color(0xff240301))),
              const SizedBox(height: 16),
              OrderDetailsRow(
                  type: "Subtotal",
                  price: "${state.totalPrice} EGP",
                  total: false),
              const SizedBox(height: 16),
              const OrderDetailsRow(
                  type: "Delivery fee", price: "EGP 10.00", total: false),
              const SizedBox(height: 16),
              const OrderDetailsRow(
                  type: "Service fee", price: "EGP 5.00", total: false),
              const SizedBox(height: 16),
              OrderDetailsRow(
                  type: "Total amount",
                  price: "${state.totalpriceDetails} EGP",
                  total: true)
            ],
          );
        } else if (state is BasketManagerDelete) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Payment summary",
                  style: AppStyles.styleSemiBold16(context)
                      .copyWith(color: const Color(0xff240301))),
              const SizedBox(height: 16),
              OrderDetailsRow(
                  type: "Subtotal",
                  price: "${state.totalPrice} EGP",
                  total: false),
              const SizedBox(height: 16),
              const OrderDetailsRow(
                  type: "Delivery fee", price: "EGP 10.00", total: false),
              const SizedBox(height: 16),
              const OrderDetailsRow(
                  type: "Service fee", price: "EGP 5.00", total: false),
              const SizedBox(height: 16),
              OrderDetailsRow(
                  type: "Total amount",
                  price: "${state.totalpriceDetails} EGP",
                  total: true)
            ],
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
