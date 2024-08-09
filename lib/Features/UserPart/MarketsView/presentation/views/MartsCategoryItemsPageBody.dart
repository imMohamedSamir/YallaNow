import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/mart_details_model/mart_details_model.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/CategoryFilterSec.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketCategoryGVSec.dart';

class MartsCategoryItemsPageBody extends StatelessWidget {
  const MartsCategoryItemsPageBody({
    super.key,
    required this.categ,
  });
  final MartDetailsModel categ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          const SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 12),
              sliver: SliverToBoxAdapter(child: CategoryFilterSec())),
          SliverFillRemaining(child: MarketCategoryGVSec(categ: categ)),
        ],
      ),
    );
  }
}
