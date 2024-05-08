import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';

class AddressLoadingPage extends StatelessWidget {
  const AddressLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Container(
                  width: AppSizes.getWidth(180, context),
                  height: AppSizes.getHeight(8, context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white),
                ),
                const SizedBox(height: 8),
                Container(
                  width: AppSizes.getWidth(130, context),
                  height: AppSizes.getHeight(6, context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white),
                ),
                const SizedBox(height: 8),
                Container(
                  width: AppSizes.getWidth(120, context),
                  height: AppSizes.getHeight(6, context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
