import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/item_page_cubit/item_page_cubit.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/mart_details_model/item.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartItemQty.dart';
import 'package:yallanow/generated/l10n.dart';

class MartItemDescription extends StatelessWidget {
  const MartItemDescription({super.key, this.item});
  final MartItem? item;
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
              Text(item?.name ?? "", style: AppStyles.styleSemiBold20(context)),
              const SizedBox(height: 4),
              Text(item?.description ?? "",
                  style: AppStyles.styleRegular16(context)
                      .copyWith(color: const Color(0xff5A5A5A))),
              const SizedBox(height: 6),
              BlocBuilder<ItemPageCubit, ItemPageState>(
                builder: (context, state) {
                  if (state is ItemPageChange) {
                    return Text(
                      "${state.updatedPrice} ${S.of(context).EGP}",
                      style: AppStyles.styleRegular14(context)
                          .copyWith(color: const Color(0xff5A5A5A)),
                    );
                  } else {
                    return Text(
                      "${item?.price} ${S.of(context).EGP}",
                      style: AppStyles.styleRegular14(context)
                          .copyWith(color: const Color(0xff5A5A5A)),
                    );
                  }
                },
              )
            ],
          ),
          const Spacer(),
          MartItemQyt(itemId: item?.id ?? "")
        ],
      ),
    );
  }
}
