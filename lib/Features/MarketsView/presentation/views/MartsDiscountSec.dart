import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/homeView/presentation/views/GroceryListView.dart';

class MartsDiscountSec extends StatelessWidget {
  const MartsDiscountSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Discount", style: AppStyles.styleMedium16(context)),
        const SizedBox(height: 16),
        const GroceryListView()
      ],
    );
  }
}
