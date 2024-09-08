import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/manager/mart_trending_items_cubit/mart_trending_items_cubit.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/GroceryItemDetails.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/MartItemLoading.dart';
import 'package:yallanow/generated/l10n.dart';

class MartsTrendingSec extends StatelessWidget {
  const MartsTrendingSec({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MartTrendingItemsCubit, MartTrendingItemsState>(
      builder: (context, state) {
        if (state is MartTrendingItemsSuccess && state.items.isNotEmpty) {
          final items = state.items;
          return SliverPadding(
            padding: const EdgeInsets.only(top: 24),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(S.of(context).Trending,
                          style: AppStyles.styleSemiBold16(context)),
                      const SizedBox(width: 4),
                      Image.asset(Assets.imagesTrendingIcon,
                          height: AppSizes.getHeight(16, context),
                          width: AppSizes.getWidth(16, context))
                    ],
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            right: items.length == index - 1 ? 0 : 12.0),
                        child: GroceryItemDetails(item: items[index]),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        } else if (state is MartTrendingItemsLoading) {
          return const SliverToBoxAdapter(child: MartItemLoading());
        } else {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
