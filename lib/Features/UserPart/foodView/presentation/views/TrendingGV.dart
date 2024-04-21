import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodItemPage.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/TrendingCard.dart';

class TrendingGV extends StatelessWidget {
  const TrendingGV({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height * 0.501,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 32, crossAxisCount: 2, mainAxisSpacing: 23),
        itemBuilder: (context, index) {
          if (index < 4) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FoodItemPage()));
                },
                child: const TrendingCard());
          } else {
            return const Text("show more");
          }
        },
      ),
    );
  }
}
