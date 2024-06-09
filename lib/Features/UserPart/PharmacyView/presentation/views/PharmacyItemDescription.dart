import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/item_page_cubit/item_page_cubit.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/models/pharmacy_details_model/PharmacyItem.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/PharmacyItemQyt.dart';

class PharmacyItemDescription extends StatelessWidget {
  const PharmacyItemDescription({super.key, required this.item});
  final PharmacyItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 24, top: 16, left: 16, right: 16),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.name!, style: AppStyles.styleSemiBold20(context)),
              const SizedBox(height: 4),
              Text(item.description!,
                  style: AppStyles.styleRegular16(context)
                      .copyWith(color: const Color(0xff5A5A5A))),
              const SizedBox(height: 6),
              BlocBuilder<ItemPageCubit, ItemPageState>(
                builder: (context, state) {
                  if (state is ItemPageChange) {
                    return Text(
                      "${state.updatedPrice} EGP",
                      style: AppStyles.styleRegular14(context)
                          .copyWith(color: const Color(0xff5A5A5A)),
                    );
                  } else {
                    return Text(
                      "${item.price} EGP",
                      style: AppStyles.styleRegular14(context)
                          .copyWith(color: const Color(0xff5A5A5A)),
                    );
                  }
                },
              )
            ],
          ),
          const Spacer(),
          PharmacyItemQyt(itemId: item.id)
        ],
      ),
    );
  }
}
