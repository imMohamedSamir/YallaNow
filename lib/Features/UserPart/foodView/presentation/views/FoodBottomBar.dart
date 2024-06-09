import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/BasketView.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodBottomBarDetails.dart';

class FoodBottomBar extends StatelessWidget {
  const FoodBottomBar({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketManagerCubit, BasketManagerState>(
      builder: (context, state) {
        if (state is BasketManagerChange) {
          if (state.isConfirmed) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BasketPage()));
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                height: AppSizes.getHeight(54, context),
                width: AppSizes.getWidth(361, context),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: pKcolor),
                child: const FoodBottomBarDetails(),
              ),
            );
          } else {
            return SizedBox(
              height: AppSizes.getHeight(107, context),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text("Add EGP 20.00 to start your order",
                      style: AppStyles.styleRegular16(context)
                          .copyWith(color: const Color(0xff5A5A5A))),
                  const SizedBox(height: 10),
                  Container(
                    height: AppSizes.getHeight(54, context),
                    width: AppSizes.getWidth(361, context),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: pKcolor.withOpacity(0.6)),
                    child: const FoodBottomBarDetails(),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
