import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/resturant_branch_details/item.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ExtarType.dart';

class FoodItemExtras extends StatelessWidget {
  const FoodItemExtras({super.key, required this.item});
  final Item item;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24, left: 0, right: 16, bottom: 16),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 16),
              Text("Extras:",
                  style: AppStyles.styleSemiBold16(context)
                      .copyWith(color: const Color(0xff240301))),
              const Spacer(),
              Container(
                width: AppSizes.getWidth(76, context),
                height: AppSizes.getHeight(23, context),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('Optional',
                    style: AppStyles.styleMedium10(context)
                        .copyWith(color: const Color(0xff5A5A5A))),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ExtarType(item: item),
        ],
      ),
    );
  }
}
