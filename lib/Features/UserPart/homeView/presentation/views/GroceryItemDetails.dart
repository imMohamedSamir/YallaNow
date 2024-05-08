import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/mart_details_model/item.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketItemPage.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/GroceryItemCard.dart';

class GroceryItemDetails extends StatelessWidget {
  const GroceryItemDetails({
    super.key,
    required this.item,
  });
  final MartItem item;
  @override
  Widget build(BuildContext context) {
    String url = item.imageUrl!.replaceAll('\\', '/');

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MarketItemPage(item: item)));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GroceryItemCard(
            imgUrl: url,
          ),
          const SizedBox(height: 14),
          Text(
            item.name ?? '',
            style: AppStyles.styleMedium14(context),
          ),
          Text(
            "${item.price} EGP",
            style: AppStyles.styleMedium14(context)
                .copyWith(color: const Color(0xff5A5A5A)),
          )
        ],
      ),
    );
  }
}
