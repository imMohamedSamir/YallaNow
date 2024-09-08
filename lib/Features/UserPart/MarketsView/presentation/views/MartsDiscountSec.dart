import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/functions/getPadding.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/manager/mart_discount_cubit/mart_discount_cubit.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/GroceryItemDetails.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/MartItemLoading.dart';
import 'package:yallanow/generated/l10n.dart';

class MartsDiscountSec extends StatelessWidget {
  const MartsDiscountSec({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MartDiscountCubit, MartDiscountState>(
      builder: (context, state) {
        if (state is MartDiscountSuccess && state.items.isNotEmpty) {
          final items = state.items;
          return SliverPadding(
            padding: const EdgeInsets.only(top: 24),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Text(S.of(context).Discount,
                      style: AppStyles.styleSemiBold16(context)),
                  const SizedBox(height: 16),
                  ListView.builder(
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
                  ),
                ],
              ),
            ),
          );
        } else if (state is MartDiscountLoading) {
          return const SliverToBoxAdapter(child: MartItemLoading());
        } else {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
