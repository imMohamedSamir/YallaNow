import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/functions/getPadding.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/popular_resturants.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/PopularResturantCard.dart';

class PopularResturansLV extends StatelessWidget {
  const PopularResturansLV({super.key, required this.resturants});
  final List<PopularResturants> resturants;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: AppSizes.getHeight(210, context),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: resturants.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: getPadding(
                  index: index,
                  lastIndex: resturants.length - 1,
                  paddingValue: 12),
              child: PopularResturantCard(
                popularResturants: resturants[index],
              ),
            );
          },
        ));
  }
}
