import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';

class MartsLoading extends StatelessWidget {
  const MartsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: index == 2 ? 0 : 16),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Row(
                children: [
                  Container(
                    height: AppSizes.getHeight(70, context),
                    width: AppSizes.getWidth(70, context),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: AppSizes.getHeight(10, context),
                        width: AppSizes.getWidth(150, context),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        height: AppSizes.getHeight(8, context),
                        width: AppSizes.getWidth(150, context),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        height: AppSizes.getHeight(8, context),
                        width: AppSizes.getWidth(145, context),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
