import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/homeView/presentation/views/EverydayRidesSec.dart';
import 'package:yallanow/Features/homeView/presentation/views/GrocerySec.dart';
import 'package:yallanow/Features/homeView/presentation/views/SearchBar.dart';
import 'package:yallanow/Features/homeView/presentation/views/categorySec.dart';
import 'package:yallanow/Features/homeView/presentation/views/offersSec.dart';
import 'package:yallanow/Features/homeView/presentation/views/popularResturants.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: const Padding(
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
            SliverPadding(
              padding: EdgeInsets.only(top: 24),
              sliver: SliverToBoxAdapter(child: OffersSec()),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 24),
              sliver: SliverToBoxAdapter(child: PopularResturansSec()),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 24),
              sliver: SliverToBoxAdapter(child: GrocerySec()),
            ),
            // SliverToBoxAdapter(child: Expanded(child: SizedBox())),
            SliverPadding(
              padding: EdgeInsets.only(top: 24, bottom: 20),
              sliver: SliverToBoxAdapter(child: EverydayRidesSec()),
            ),
          ],
        ),
      ),
    );
  }
}
