import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';
import 'package:yallanow/generated/l10n.dart';

class FoodBottomBarDetails extends StatelessWidget {
  const FoodBottomBarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketManagerCubit, BasketManagerState>(
      builder: (context, state) {
        if (state is BasketManagerChange) {
          if (state.items.isNotEmpty) {
            return Row(
              children: [
                Container(
                  width: AppSizes.getWidth(23, context),
                  height: AppSizes.getHeight(27, context),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4)),
                  child: Center(
                    child: Text(
                      state.items.length.toString(),
                      style: AppStyles.styleMedium16(context)
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text("View basket",
                    style: AppStyles.styleMedium16(context)
                        .copyWith(color: Colors.white)),
                const Spacer(),
                // Text("${state.totalPrice} EGP",
                //     style: AppStyles.styleMedium16(context)
                //         .copyWith(color: Colors.white)),
              ],
            );
          } else {
            return Row(
              children: [
                Container(
                  width: AppSizes.getWidth(23, context),
                  height: AppSizes.getHeight(27, context),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4)),
                  child: Center(
                    child: Text(
                      state.items.length.toString(),
                      style: AppStyles.styleMedium16(context)
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text("View basket",
                    style: AppStyles.styleMedium16(context)
                        .copyWith(color: Colors.white)),
                const Spacer(),
                Text("${state.totalPrice} EGP",
                    style: AppStyles.styleMedium16(context)
                        .copyWith(color: Colors.white)),
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

class FoodBottomBarDetailsTest extends StatelessWidget {
  const FoodBottomBarDetailsTest(
      {super.key, required this.length, required this.totalPrice});
  final int length;
  final double totalPrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: AppSizes.getWidth(23, context),
          height: AppSizes.getHeight(27, context),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4)),
          child: Center(
            child: Text(
              length.toString(),
              style: AppStyles.styleMedium16(context)
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(S.of(context).ViewBasket,
            style:
                AppStyles.styleMedium16(context).copyWith(color: Colors.white)),
        const Spacer(),
        Text("$totalPrice ${S.of(context).EGP}",
            style:
                AppStyles.styleMedium16(context).copyWith(color: Colors.white)),
      ],
    );
    BlocBuilder<BasketManagerCubit, BasketManagerState>(
      builder: (context, state) {
        if (state is BasketManagerChange) {
          if (state.items.isNotEmpty) {
            return Row(
              children: [
                Container(
                  width: AppSizes.getWidth(23, context),
                  height: AppSizes.getHeight(27, context),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4)),
                  child: Center(
                    child: Text(
                      state.items.length.toString(),
                      style: AppStyles.styleMedium16(context)
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text("View basket",
                    style: AppStyles.styleMedium16(context)
                        .copyWith(color: Colors.white)),
                const Spacer(),
                // Text("${state.totalPrice} EGP",
                //     style: AppStyles.styleMedium16(context)
                //         .copyWith(color: Colors.white)),
              ],
            );
          } else {
            return Row(
              children: [
                Container(
                  width: AppSizes.getWidth(23, context),
                  height: AppSizes.getHeight(27, context),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4)),
                  child: Center(
                    child: Text(
                      state.items.length.toString(),
                      style: AppStyles.styleMedium16(context)
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text("View basket",
                    style: AppStyles.styleMedium16(context)
                        .copyWith(color: Colors.white)),
                const Spacer(),
                Text("${state.totalPrice} EGP",
                    style: AppStyles.styleMedium16(context)
                        .copyWith(color: Colors.white)),
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
