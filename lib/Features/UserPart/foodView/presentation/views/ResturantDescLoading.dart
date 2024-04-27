import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';

class ResturantDescLoading extends StatelessWidget {
  const ResturantDescLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: AppSizes.getHeight(10, context),
            width: AppSizes.getWidth(300, context),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.symmetric(horizontal: 8),
          ),
          const SizedBox(height: 12),
          Container(
            height: AppSizes.getHeight(8, context),
            width: AppSizes.getWidth(200, context),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.symmetric(horizontal: 8),
          ),
          const SizedBox(height: 6),
          Container(
            height: AppSizes.getHeight(8, context),
            width: AppSizes.getWidth(145, context),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.symmetric(horizontal: 8),
          ),
        ],
      ),
    );
  }
}
