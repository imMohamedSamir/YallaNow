import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/views/BasketButtonsSec.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/views/OrderDetails.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/views/SelectedItemsSec.dart';

class BasketViewBody extends StatelessWidget {
  const BasketViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 40),
          SelectedItemsSec(),
          SizedBox(height: 16),
          OrderDetails(),
          Spacer(),
          BasketButtonsSec(),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
