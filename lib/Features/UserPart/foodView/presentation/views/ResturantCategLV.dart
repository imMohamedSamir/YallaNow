import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/restrunt_details/item.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ResturantCategCard.dart';

class ResturantCategLV extends StatelessWidget {
  const ResturantCategLV({super.key, required this.items});
  final List<FoodItem> items;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ResturantCategCard(
          item: items[index],
        );
      },
    );
  }
}
