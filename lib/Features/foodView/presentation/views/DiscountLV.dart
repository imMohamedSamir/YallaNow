import 'package:flutter/material.dart';
import 'package:yallanow/Features/foodView/presentation/views/DiscountCard.dart';

class DiscountLV extends StatelessWidget {
  const DiscountLV({super.key});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.55,
      width: double.infinity,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: false,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return const DiscountCard();
        },
      ),
    );
  }
}
