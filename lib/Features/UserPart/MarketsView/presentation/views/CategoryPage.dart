import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/CategoryFilterSec.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketCategoryGVSec.dart';

class MarketCategoryPage extends StatelessWidget {
  const MarketCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: categoryAppBar(context, title: "Marts"),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
                padding: EdgeInsets.only(top: 12),
                sliver: SliverToBoxAdapter(child: CategoryFilterSec())),
            SliverPadding(
                padding: EdgeInsets.only(top: 24, bottom: 16),
                sliver: SliverToBoxAdapter(child: MarketCategoryGVSec())),
          ],
        ),
      ),
    );
  }
}
