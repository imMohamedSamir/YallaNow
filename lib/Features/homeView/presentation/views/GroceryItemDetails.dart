import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/homeView/presentation/views/GroceryItemCard.dart';

class GroceryItemDetails extends StatelessWidget {
  const GroceryItemDetails({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GroceryItemCard(),
        const SizedBox(height: 14),
        Text(
          "Almarai Yogurt ",
          style: AppStyles.styleMedium14(context),
        ),
        Text(
          "78.95 EGP",
          style: AppStyles.styleMedium14(context)
              .copyWith(color: const Color(0xff5A5A5A)),
        )
      ],
    );
  }
}
