import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartsHomeOffers.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/SuperMarketsSec.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/SearchBar.dart';

class MarketsViewBody extends StatelessWidget {
  const MarketsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(top: 12),
            sliver: SliverToBoxAdapter(child: MartsSearchBar()),
          ),
          MartsHomeOffers(),
          SuperMarketsSec()
        ],
      ),
    );
  }
}
