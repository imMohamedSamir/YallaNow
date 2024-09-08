import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/utlis/functions/getTotalPrice.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/BasketView.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodBottomBarDetails.dart';
import 'package:yallanow/generated/l10n.dart';

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

class FoodBottomBarTest extends StatelessWidget {
  const FoodBottomBarTest({super.key});
  @override
  Widget build(BuildContext context) {
    final box = Hive.box<SelectedItemsModel>(kBasket);

    return ValueListenableBuilder(
      valueListenable: box.listenable(),
      builder: (BuildContext context, box, _) {
        bool isConfirmed = false;
        double totalPrice = getSubTotalPrice();
        if (totalPrice > 20) {
          isConfirmed = true;
        }
        return InkWell(
          onTap: isConfirmed
              ? () {
                  NavigateToPage.slideFromBottomAndFade(
                      context: context, page: const BasketPage());
                }
              : null,
          child: SizedBox(
            height: AppSizes.getHeight(isConfirmed ? 95 : 107, context),
            child: Column(
              children: [
                const SizedBox(height: 10),
                if (!isConfirmed)
                  Text(S.of(context).BasketStartMsg,
                      style: AppStyles.styleRegular16(context)
                          .copyWith(color: const Color(0xff5A5A5A))),
                const SizedBox(height: 10),
                Container(
                  height: AppSizes.getHeight(54, context),
                  width: AppSizes.getWidth(361, context),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: isConfirmed ? pKcolor : pKcolor.withOpacity(0.6)),
                  child: FoodBottomBarDetailsTest(
                    length: box.length,
                    totalPrice: totalPrice,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}
