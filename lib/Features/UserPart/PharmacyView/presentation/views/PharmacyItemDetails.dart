import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/functions/DialogMethode.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/item_page_cubit/item_page_cubit.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/models/pharmacy_details_model/PharmacyItem.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyItemCard.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyItemPage.dart';

class PharmacyItemDetails extends StatelessWidget {
  const PharmacyItemDetails({
    super.key,
    required this.item,
  });
  final PharmacyItem item;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ItemPageCubit, ItemPageState>(
      listener: (context, state) {
        if (state is ItemPageChange) {
          if (state.isOtherPartner) {
            return clearTheBasketDialogInPage(context, itmeId: item.id);
          }
        }
      },
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PharmacyItemPage(item: item)));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PharmacyItemCard(item: item),
            const SizedBox(height: 14),
            Text(
              item.name!,
              style: AppStyles.styleMedium14(context),
            ),
            Text(
              "${item.price} EGP",
              style: AppStyles.styleMedium14(context)
                  .copyWith(color: const Color(0xff5A5A5A)),
            )
          ],
        ),
      ),
    );
  }
}
