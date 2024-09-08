import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/functions/getPadding.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/mart_details_model/item.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/manager/mart_items_cubit/mart_items_cubit.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/GroceryItemDetails.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/MartItemLoading.dart';

class GroceryListView extends StatelessWidget {
  const GroceryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(203, context),
      child: BlocBuilder<MartItemsCubit, MartItemsState>(
        builder: (context, state) {
          if (state is MartItemsSuccess) {
            final List<MartItem> items = state.items;
            return ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: getPadding(
                      index: index,
                      lastIndex: items.length - 1,
                      paddingValue: 12),
                  child: GroceryItemDetails(item: items[index]),
                );
              },
            );
          } else if (state is MartItemsLoading) {
            return const MartItemLoading();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
