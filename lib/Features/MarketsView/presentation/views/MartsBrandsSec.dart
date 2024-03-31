import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/MarketsView/presentation/views/MartsBrandsLV.dart';

class MartsBrandsSec extends StatelessWidget {
  const MartsBrandsSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Brands", style: AppStyles.styleMedium16(context)),
        const SizedBox(height: 16),
        const MartsBrandsLV()
      ],
    );
  }
}
