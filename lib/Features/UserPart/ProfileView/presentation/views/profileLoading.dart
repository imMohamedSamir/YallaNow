import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';

class ProfileLoading extends StatelessWidget {
  const ProfileLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: AppSizes.getWidth(120, context),
              height: AppSizes.getHeight(120, context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
            ),
            const SizedBox(height: 50),
            ...List.generate(
              5,
              (index) => Container(
                width: AppSizes.getWidth(130, context),
                height: AppSizes.getHeight(50, context),
                margin: const EdgeInsets.only(bottom: 25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class VehiclesPageLoading extends StatelessWidget {
  const VehiclesPageLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              height: AppSizes.getHeight(130, context),
              // margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.white),
            ),
            const SizedBox(height: 50),
            ...List.generate(
              5,
              (index) => Container(
                width: AppSizes.getWidth(130, context),
                height: AppSizes.getHeight(50, context),
                margin: const EdgeInsets.only(bottom: 25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
