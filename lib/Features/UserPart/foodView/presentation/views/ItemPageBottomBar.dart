import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/restrunt_details/item.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodBottomBar.dart';

class ItemPageBottomBar extends StatelessWidget {
  const ItemPageBottomBar({Key? key, this.item}) : super(key: key);
  final Item? item;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return ListTile(
      onTap: () {
        BlocProvider.of<BasketManagerCubit>(context)
            .addToBasket(itemID: item!.itemId!);
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      title: BlocBuilder<BasketManagerCubit, BasketManagerState>(
        builder: (context, state) {
          if (state is BasketManagerAdd) {
            return FoodBottomBar();
          } else {
            return Container(
              height: height * 0.065,
              width: width * 0.91,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xffB20404),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Text(
                    "Add to basket",
                    style: AppStyles.styleMedium16(context)
                        .copyWith(color: Colors.white),
                  ),
                  const Spacer(),
                  BlocBuilder<BasketManagerCubit, BasketManagerState>(
                    builder: (context, state) {
                      if (state is BasketManagerChangeQty) {
                        return Text(
                          "${state.price} EGP",
                          style: AppStyles.styleMedium16(context)
                              .copyWith(color: Colors.white),
                        );
                      } else if (state is BasketManagerSize) {
                        return Text(
                          "${state.price} EGP",
                          style: AppStyles.styleMedium16(context)
                              .copyWith(color: Colors.white),
                        );
                      } else {
                        return Text(
                          "Price on selection",
                          style: AppStyles.styleMedium16(context)
                              .copyWith(color: Colors.white),
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
      tileColor: Colors.white,
    );
  }
}
