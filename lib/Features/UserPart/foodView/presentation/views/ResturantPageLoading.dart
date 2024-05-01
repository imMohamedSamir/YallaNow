import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';

class ResturantPageLoading extends StatelessWidget {
  const ResturantPageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Container(
              height: AppSizes.getHeight(10, context),
              width: AppSizes.getWidth(380, context),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
            ),
            const SizedBox(height: 8),
            ...List.generate(
                3,
                (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: AppSizes.getHeight(100, context),
                            width: AppSizes.getWidth(100, context),
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: AppSizes.getHeight(12, context),
                                width: AppSizes.getWidth(200, context),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                height: AppSizes.getHeight(8, context),
                                width: AppSizes.getWidth(150, context),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                height: AppSizes.getHeight(8, context),
                                width: AppSizes.getWidth(120, context),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                              )
                            ],
                          )
                        ],
                      ),
                    ))
          ],
        ));
  }
}
