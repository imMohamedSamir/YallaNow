import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodOffersSec.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodTopCategorySec.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/RestOfFoodPage.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/SearchBar.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/popularResturants.dart';

class FoodViewBody extends StatelessWidget {
  const FoodViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(top: 12),
            sliver: SliverToBoxAdapter(child: FoodSearchBar()),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 12),
            sliver: SliverToBoxAdapter(child: FoodTopCategorySec()),
          ),
          FoodOffersSec(),

          // SliverPadding(
          //   padding: EdgeInsets.only(top: 24),
          //   sliver: SliverToBoxAdapter(child: RecommendedforyouSec()),
          // ),
          PopularResturansSec(),
          SliverToBoxAdapter(child: SizedBox(height: 24)),
          ExploreRestaurantLV()
        ],
      ),
    );
  }
}
