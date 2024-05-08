import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/mart_details_model/mart_details_model.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketCategoryGV.dart';

class MarketCategoryGVSec extends StatelessWidget {
  const MarketCategoryGVSec({super.key, required this.categ});
  final MartDetailsModel categ;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(categ.name ?? "", style: AppStyles.styleMedium16(context)),
        const SizedBox(height: 16),
        MarketCategoryGV(items: categ.items ?? [])
      ],
    );
  }
}
