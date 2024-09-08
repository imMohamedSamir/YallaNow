import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/mart_details_model/item.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/GroceryAddIcon.dart';
import 'package:yallanow/generated/l10n.dart';

class GroceryItemCard extends StatelessWidget {
  const GroceryItemCard({
    super.key,
    required this.item,
  });
  final MartItem item;
  @override
  Widget build(BuildContext context) {
    String url = item.imageUrl!.replaceAll('\\', '/');
    return Container(
      width: AppSizes.getWidth(148, context),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          color: const Color(0xffF5F5F5),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Positioned(left: 0, top: 0, child: SalesMark(width: width)),
          ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(imageUrl: url)),
          const Gap(8),
          Text(
            item!.name ?? '',
            style: AppStyles.styleMedium14(context),
          ),
          Text(
            "${item!.price} ${S.of(context).EGP}",
            style: AppStyles.styleMedium14(context)
                .copyWith(color: const Color(0xff5A5A5A)),
          )
          // Positioned(right: 7, bottom: 7, child: GroceryAddIcon(item: item))
        ],
      ),
    );
  }
}
