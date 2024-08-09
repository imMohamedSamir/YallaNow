import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/top_categ_resturant.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/explore_resturants_cubit/explore_resturants_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/PopularLoading.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/PopularResturantCard.dart';
import 'package:yallanow/generated/l10n.dart';

class ExploreRestaurantLV extends StatelessWidget {
  const ExploreRestaurantLV({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreResturantsCubit, ExploreResturantsState>(
      builder: (context, state) {
        if (state is ExploreResturantsSuccess && state.resturants.isNotEmpty) {
          List<TopCategResturant> resturants = state.resturants;
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (index == 0)
                      Text(
                        S.of(context).ExploreResturants,
                        style: AppStyles.styleMedium16(context),
                      ),
                    const Gap(8),
                    RestFoodCard(resturantModel: resturants[index]),
                  ],
                );
              },
              childCount: resturants.length,
            ),
          );
        } else if (state is ExploreResturantsLoading) {
          return const SliverToBoxAdapter(child: ExploreLoading());
        } else {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
