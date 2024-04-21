import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/DiscountCard.dart';

class DiscountLV extends StatelessWidget {
  const DiscountLV({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const DiscountCard();
      },
    );
  }
}
