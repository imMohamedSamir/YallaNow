import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/functions/DialogMethode.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/item_page_cubit/item_page_cubit.dart';
import 'package:yallanow/generated/l10n.dart';

class ItemPageBottomBar extends StatelessWidget {
  const ItemPageBottomBar({Key? key, this.itemId}) : super(key: key);
  final String? itemId;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        BlocProvider.of<ItemPageCubit>(context).addToBasket(itemID: itemId!);
        BlocProvider.of<BasketManagerCubit>(context).getBasketItems();
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      title: BlocListener<ItemPageCubit, ItemPageState>(
          listener: (context, state) {
            if (state is ItemPageChange) {
              if (state.isOtherPartner) {
                return clearTheBasketDialog(context, itmeId: itemId);
              }
            } else if (state is ItemPageAdded) {
              Navigator.pop(context);
            }
          },
          child: Container(
            height: AppSizes.getHeight(54, context),
            width: AppSizes.getWidth(361, context),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xffB20404),
            ),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Text(
                  S.of(context).AddToBasket,
                  style: AppStyles.styleMedium16(context)
                      .copyWith(color: Colors.white),
                ),
                const Spacer(),
                BlocBuilder<ItemPageCubit, ItemPageState>(
                  builder: (context, state) {
                    if (state is ItemPageChange) {
                      return Text(
                        "${state.updatedPrice} ${S.of(context).EGP}",
                        style: AppStyles.styleMedium16(context)
                            .copyWith(color: Colors.white),
                      );
                    } else {
                      return Text(
                        S.of(context).PriceOnSelection,
                        style: AppStyles.styleMedium16(context)
                            .copyWith(color: Colors.white),
                      );
                    }
                  },
                ),
              ],
            ),
          )),
      tileColor: Colors.white,
    );
  }
}
