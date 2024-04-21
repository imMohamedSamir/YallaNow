import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/SuperMarketsLV.dart';

class SuperMarketsSec extends StatelessWidget {
  const SuperMarketsSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("super markets", style: AppStyles.styleMedium16(context)),
        const SizedBox(height: 24),
        const SuperMarketsLV()
      ],
    );
  }
}
