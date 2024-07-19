import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';

class CaptinLoading extends StatelessWidget {
  const CaptinLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Row(
        children: [
          Container(
            height: AppSizes.getHeight(70, context),
            width: AppSizes.getWidth(70, context),
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            margin: const EdgeInsets.symmetric(horizontal: 8),
          ),
          // const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: AppSizes.getHeight(20, context),
                width: AppSizes.getWidth(150, context),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                margin: const EdgeInsets.symmetric(horizontal: 8),
              ),
              const SizedBox(height: 12),
              Container(
                height: AppSizes.getHeight(10, context),
                width: AppSizes.getWidth(150, context),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                margin: const EdgeInsets.symmetric(horizontal: 8),
              ),
              const SizedBox(height: 6),
            ],
          ),
        ],
      ),
    );
  }
}
