import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/MarketsView/presentation/views/MarketCategoryGV.dart';

class MarketCategoryGVSec extends StatelessWidget {
  const MarketCategoryGVSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Rice", style: AppStyles.styleMedium16(context)),
        const SizedBox(height: 16),
        MarketCategoryGV()
      ],
    );
  }
}
