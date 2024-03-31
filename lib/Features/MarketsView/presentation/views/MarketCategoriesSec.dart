import 'package:flutter/material.dart';
import 'package:yallanow/Features/MarketsView/presentation/views/CategoriesGV.dart';
import 'package:yallanow/Features/MarketsView/presentation/views/CategoriesHeader.dart';

class MarketCategoriesSec extends StatelessWidget {
  const MarketCategoriesSec({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoriesHeader(),
        SizedBox(height: 16),
        CategoriesGV(),
      ],
    );
  }
}
