import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';

class TripPlacesLoading extends StatelessWidget {
  const TripPlacesLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(right: 12),
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: AppSizes.getWidth(100, context),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(32)),
            margin: EdgeInsets.only(right: index == 5 ? 0 : 18),
          ),
        );
      },
    );
  }
}
