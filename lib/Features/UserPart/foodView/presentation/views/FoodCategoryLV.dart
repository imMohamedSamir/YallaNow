import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/popular_food_category_cubit/popular_food_category_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodCategory.dart';

class FoodCategoryLV extends StatelessWidget {
  const FoodCategoryLV({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularFoodCategoryCubit, PopularFoodCategoryState>(
      builder: (context, state) {
        if (state is PopularFoodCategoryLoading) {
          return SizedBox(
            height: AppSizes.getHeight(85, context),
            child: ListView.builder(
              padding: const EdgeInsets.only(right: 12),
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: AppSizes.getWidth(77, context),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32)),
                    margin: EdgeInsets.only(right: index == 5 ? 0 : 18),
                  ),
                );
              },
            ),
          );
        } else if (state is PopularFoodCategorySuccess) {
          var categories = state.categories;
          return SizedBox(
            height: AppSizes.getHeight(93, context),
            child: ListView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      right: index == categories.length - 1 ? 0 : 24.0),
                  child: FoodCategory(
                    color: _getRandomColor(),
                    popularFoodCategory: categories[index],
                  ),
                );
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Color _getRandomColor() {
    final random = Random();
    final hslColor = HSLColor.fromColor(
      Color.fromARGB(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        255, // Full opacity
      ).withOpacity(0.17),
    );
    return hslColor.toColor();
  }
}
