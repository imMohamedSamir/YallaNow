import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/PopularMartsLV.dart';

class GrocerySec extends StatelessWidget {
  const GrocerySec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Popular Marts', style: AppStyles.styleMedium16(context)),
        const SizedBox(height: 16),
        const PopularMartsLV()
      ],
    );
  }
}
