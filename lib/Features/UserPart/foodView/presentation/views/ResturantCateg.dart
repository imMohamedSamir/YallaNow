import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/resturant_branch_details/item.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ResturantCategLV.dart';

class ResturantCateg extends StatelessWidget {
  const ResturantCateg({super.key, required this.items, required this.name});
  final List<Item> items;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name,
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff240301))),
        const SizedBox(height: 24),
        ResturantCategLV(items: items)
      ],
    );
  }
}
