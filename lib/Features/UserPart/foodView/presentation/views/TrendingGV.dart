import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodItemPage.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/TrendingCard.dart';

class TrendingGV extends StatelessWidget {
  const TrendingGV({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 32, crossAxisCount: 2, mainAxisSpacing: 23),
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FoodItemPage()));
            },
            child: const TrendingCard());
      },
    );
  }
}
