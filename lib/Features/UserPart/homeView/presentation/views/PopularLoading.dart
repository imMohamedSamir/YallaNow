import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';

class PopularLoading extends StatelessWidget {
  const PopularLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(150, context),
      child: ListView.builder(
        padding: const EdgeInsets.only(right: 12, top: 24),
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
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.symmetric(horizontal: 8),
            ),
          );
        },
      ),
    );
  }
}

class ExploreLoading extends StatelessWidget {
  const ExploreLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(right: 12),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: pKcolor.withOpacity(0.1),
          child: Container(
            height: AppSizes.getHeight(100, context),
            width: AppSizes.getWidth(145, context),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.symmetric(vertical: 8),
          ),
        );
      },
    );
  }
}
