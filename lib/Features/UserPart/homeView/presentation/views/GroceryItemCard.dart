import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/mart_details_model/item.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/GroceryAddIcon.dart';

class GroceryItemCard extends StatelessWidget {
  const GroceryItemCard({
    super.key,
    required this.imgUrl,
    this.item,
  });
  final String imgUrl;
  final MartItem? item;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: AppSizes.getWidth(148, context),
        decoration: BoxDecoration(
            color: const Color(0xffF5F5F5),
            borderRadius: BorderRadius.circular(16)),
        child: Stack(
          children: [
            // Positioned(left: 0, top: 0, child: SalesMark(width: width)),
            Positioned(
              top: 10,
              left: 14,
              right: 14,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(imgUrl)),
            ),
            Positioned(right: 7, bottom: 7, child: GroceryAddIcon(item: item))
          ],
        ),
      ),
    );
  }
}
