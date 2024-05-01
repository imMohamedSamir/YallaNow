import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/resturant_branch_details/item.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodItemQyt.dart';

class FoodItemDescription extends StatelessWidget {
  const FoodItemDescription({super.key, this.item});
  final Item? item;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 24, top: 16, left: 16, right: 16),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item?.itemName ?? "",
                  style: AppStyles.styleSemiBold20(context)),
              const SizedBox(height: 4),
              Text(item?.itemDescription ?? "",
                  style: AppStyles.styleRegular16(context)
                      .copyWith(color: const Color(0xff5A5A5A))),
              const SizedBox(height: 6),
              Text(
                "${item!.itemPrice} EGP",
                style: AppStyles.styleRegular14(context)
                    .copyWith(color: const Color(0xff5A5A5A)),
              )
            ],
          ),
          const Spacer(),
          const FoodItemQyt()
        ],
      ),
    );
  }
}
