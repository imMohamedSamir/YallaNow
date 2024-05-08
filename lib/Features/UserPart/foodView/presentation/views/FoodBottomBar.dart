import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodBottomBarDetails.dart';
import 'package:yallanow/main.dart';

class FoodBottomBar extends StatelessWidget {
  const FoodBottomBar({super.key});
  @override
  Widget build(BuildContext context) {
    bool isActive = false;
    return BlocConsumer<BasketManagerCubit, BasketManagerState>(
      listener: (context, state) {
        if (state is BasketManagerAdd) {
          isActive = double.parse(state.totalPrice) > 20;
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: AppSizes.getHeight(107, context),
          child: Column(
            children: [
              SizedBox(height: isActive ? 0 : 10),
              isActive
                  ? const SizedBox()
                  : Text("Add EGP 20.00 to start your order",
                      style: AppStyles.styleRegular16(context)
                          .copyWith(color: const Color(0xff5A5A5A))),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  if (isActive) {
                    Navigator.pushNamed(context, RoutesNames.basket);
                  }
                },
                child: Container(
                  height: AppSizes.getHeight(54, context),
                  width: AppSizes.getWidth(361, context),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: isActive ? pKcolor : pKcolor.withOpacity(0.6)),
                  child: const FoodBottomBarDetails(),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
