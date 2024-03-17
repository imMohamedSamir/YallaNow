import 'package:flutter/material.dart';
import 'package:yallanow/Features/homeView/presentation/views/LocationAppBar.dart';
import 'package:yallanow/Features/homeView/presentation/views/SearchBar.dart';
import 'package:yallanow/Features/homeView/presentation/views/categorySec.dart';
import 'package:yallanow/Features/homeView/presentation/views/offersSec.dart';
import 'package:yallanow/Features/homeView/presentation/views/popularResturants.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const LocationAppBar(),
      ),
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
              // sliver: SliverToBoxAdapter(child: PopularResturansSec()),
            ),
          ],
        ),
      ),
    );
  }
}
