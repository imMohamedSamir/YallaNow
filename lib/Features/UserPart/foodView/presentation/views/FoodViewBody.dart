import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodOffersSec.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodTopCategorySec.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/RecommendedforyouSec.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/RestOfFoodPage.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/SearchBar.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/popularResturants.dart';

class FoodViewBody extends StatelessWidget {
  const FoodViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          const SliverPadding(
            padding: EdgeInsets.only(top: 12),
            sliver: SliverToBoxAdapter(child: FoodSearchBar()),
          ),
          const SliverPadding(
            padding: EdgeInsets.only(top: 12),
            sliver: SliverToBoxAdapter(child: FoodTopCategorySec()),
          ),
          const SliverPadding(
            padding: EdgeInsets.only(top: 12),
            sliver: SliverToBoxAdapter(child: FoodOffersSec()),
          ),
          const SliverPadding(
            padding: EdgeInsets.only(top: 24),
            sliver: SliverToBoxAdapter(child: RecommendedforyouSec()),
          ),
          const SliverPadding(
            padding: EdgeInsets.only(top: 24),
            sliver: SliverToBoxAdapter(child: PopularResturansSec()),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(
            child: Text("Explore restaurant",
                style: AppStyles.styleMedium16(context)),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          const SliverFillRemaining(
              child: Expanded(child: ExploreRestaurantLV())),
        ],
      ),
    );
  }
}
