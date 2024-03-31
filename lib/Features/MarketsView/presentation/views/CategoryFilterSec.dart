import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/MarketsView/presentation/views/CategoryFilterLV.dart';

class CategoryFilterSec extends StatelessWidget {
  const CategoryFilterSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Food cupboard", style: AppStyles.styleMedium16(context)),
        const SizedBox(height: 16),
        const CategoryFilterLV()
      ],
    );
  }
}
