import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketCategoriesSec.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketsOffersSec.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartsBrandsSec.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartsDiscountSec.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartsForYouSec.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartsTrendingSec.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/SearchBar.dart';

class MarketPageBody extends StatelessWidget {
  const MarketPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          // SliverPadding(
          //   padding: EdgeInsets.only(top: 12),
          //   sliver: SliverToBoxAdapter(child: HomeSearchBar()),
          // ),
          SliverPadding(
            padding: EdgeInsets.only(top: 12),
            sliver: SliverToBoxAdapter(child: MarketCategoriesSec()),
          ),
          MartsTrendingSec(),
          MarketsOffersSec(),
          // SliverPadding(
          //   padding: EdgeInsets.only(top: 24),
          //   sliver: SliverToBoxAdapter(child: MartsBrandsSec()),
          // ),
          SliverPadding(
            padding: EdgeInsets.only(top: 24),
            sliver: SliverToBoxAdapter(child: MartsForYouSec()),
          ),
          MartsDiscountSec(),

          SliverPadding(padding: EdgeInsets.only(top: 24)),
        ],
      ),
    );
  }
}
