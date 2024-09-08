import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/mart_details_model/item.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/GroceryItemDetails.dart';

class MarketCategoryGV extends StatelessWidget {
  const MarketCategoryGV({super.key, required this.items});
  final List<MartItem> items;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: items.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10, crossAxisSpacing: 12, crossAxisCount: 2),
      itemBuilder: (context, index) {
        return GroceryItemDetails(item: items[index]);
      },
    );
  }
}
