import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/mart_details_model/mart_details_model.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketCategoryGV.dart';

class MarketCategoryGVSec extends StatelessWidget {
  const MarketCategoryGVSec({super.key, required this.categ});
  final MartDetailsModel categ;
  @override
  Widget build(BuildContext context) {
    return MarketCategoryGV(items: categ.items ?? []);
  }
}
