import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/PopulareTripsSec.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripsExplore.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/categorySec.dart';

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
          // SliverPadding(
          //   padding: EdgeInsets.only(top: 12),
          //   sliver: SliverToBoxAdapter(child: HomeSearchBar()),
          // ),
          SliverPadding(
            padding: EdgeInsets.only(top: 13),
            sliver: SliverToBoxAdapter(child: CategorySec()),
          ),
          SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 16),
              sliver: SliverToBoxAdapter(child: PopulareTripsSec())),
          // SliverPadding(
          //   padding: EdgeInsets.only(top: 24),
          //   sliver: SliverToBoxAdapter(child: FoodOffersSec()),
          // ),
          // SliverPadding(
          //   padding: EdgeInsets.only(top: 24),
          //   sliver: SliverToBoxAdapter(child: PopularResturansSec()),
          // ),
          // SliverPadding(
          //   padding: EdgeInsets.only(top: 24),
          //   sliver: SliverToBoxAdapter(child: GrocerySec()),
          // ),
          // SliverToBoxAdapter(child: Expanded(child: SizedBox())),
          // SliverPadding(
          //   padding: EdgeInsets.only(top: 24, bottom: 20),
          //   sliver: SliverToBoxAdapter(child: EverydayRidesSec()),
          // ),
          SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 16),
              sliver: SliverToBoxAdapter(child: TripsExplore()))
        ],
      ),
    );
  }
}
