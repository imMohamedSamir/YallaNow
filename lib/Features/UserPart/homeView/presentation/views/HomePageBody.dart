import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/PopulareTripsSec.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/GrocerySec.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/HomeOffersSec.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/SearchBar.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/categorySec.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/popularResturants.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(top: 12),
            sliver: SliverToBoxAdapter(child: HomeSearchBar()),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 13),
            sliver: SliverToBoxAdapter(child: CategorySec()),
          ),
          HomeOffersSec(),

          SliverPadding(
              padding: EdgeInsets.only(top: 16),
              sliver: SliverToBoxAdapter(child: PopulareTripsSec())),
          PopularResturansSec(),
          GrocerySec()

          // SliverToBoxAdapter(child: Expanded(child: SizedBox())),
          // SliverPadding(
          //   padding: EdgeInsets.only(top: 24, bottom: 20),
          //   sliver: SliverToBoxAdapter(child: EverydayRidesSec()),
          // ),
        ],
      ),
    );
  }
}
