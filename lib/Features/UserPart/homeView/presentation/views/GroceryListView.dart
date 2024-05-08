import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/mart_details_model/item.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/manager/mart_items_cubit/mart_items_cubit.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketItemPage.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/GroceryItemDetails.dart';

class GroceryListView extends StatelessWidget {
  const GroceryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(203, context),
      child: BlocBuilder<MartItemsCubit, MartItemsState>(
        builder: (context, state) {
          if (state is MartItemsSuccess) {
            List<MartItem> items = state.items;
            return ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      right: items.length == index - 1 ? 0 : 12.0),
                  child: GroceryItemDetails(
                    item: items[index],
                  ),
                );
              },
            );
          } else if (state is MartItemsLoading) {
            return ListView.builder(
              padding: const EdgeInsets.only(right: 12),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: pKcolor.withOpacity(0.1),
                  child: Container(
                    height: AppSizes.getHeight(100, context),
                    width: AppSizes.getWidth(145, context),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                );
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
// GroceryItemDetails()