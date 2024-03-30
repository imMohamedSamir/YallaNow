import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/foodView/presentation/views/FoodCategoryLV.dart';
import 'package:yallanow/Features/foodView/presentation/views/RecommendedforyouSec.dart';
import 'package:yallanow/Features/foodView/presentation/views/RestOfFoodPage.dart';
import 'package:yallanow/Features/homeView/presentation/views/SearchBar.dart';
import 'package:yallanow/Features/homeView/presentation/views/offersSec.dart';
import 'package:yallanow/Features/homeView/presentation/views/popularResturants.dart';

class FoodViewBody extends StatelessWidget {
  const FoodViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FoodAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            const SliverPadding(
              padding: EdgeInsets.only(top: 12),
              sliver: SliverToBoxAdapter(child: HomeSearchBar()),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(top: 12),
              sliver: SliverToBoxAdapter(child: FoodCategorySec()),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(top: 12),
              sliver: SliverToBoxAdapter(child: OffersSec()),
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
      ),
    );
  }
}
