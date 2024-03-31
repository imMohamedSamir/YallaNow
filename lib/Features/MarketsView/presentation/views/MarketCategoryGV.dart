import 'package:flutter/material.dart';
import 'package:yallanow/Features/homeView/presentation/views/GroceryItemDetails.dart';

class MarketCategoryGV extends StatelessWidget {
  const MarketCategoryGV({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10, crossAxisSpacing: 16, crossAxisCount: 2),
      itemBuilder: (context, index) {
        return const GroceryItemDetails();
      },
    );
  }
}
