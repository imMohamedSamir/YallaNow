import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketCategoriesSec.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketsOffersSec.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartsBrandsSec.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartsDiscountSec.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartsForYouSec.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartsTrendingSec.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/SearchBar.dart';

class MartPageBody extends StatelessWidget {
  const MartPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(top: 12),
            sliver: SliverToBoxAdapter(child: HomeSearchBar()),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 12),
            sliver: SliverToBoxAdapter(child: MarketCategoriesSec()),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 24),
            sliver: SliverToBoxAdapter(child: MartsTrendingSec()),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 24),
            sliver: SliverToBoxAdapter(child: MarketsOffersSec()),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 24),
            sliver: SliverToBoxAdapter(child: MartsBrandsSec()),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 24),
            sliver: SliverToBoxAdapter(child: MartsForYouSec()),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 24),
            sliver: SliverToBoxAdapter(child: MartsDiscountSec()),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 24),
          ),
        ],
      ),
    );
  }
}
