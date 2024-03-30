import 'package:flutter/material.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/SignUpAppBar.dart';
import 'package:yallanow/Features/foodView/presentation/views/BasketButtonsSec.dart';
import 'package:yallanow/Features/foodView/presentation/views/OrderDetails.dart';
import 'package:yallanow/Features/foodView/presentation/views/SelectedItemsSec.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: basketCustomAppBar(context, title: "Basket", onPressed: () {
        Navigator.pop(context);
      }),
      body: const Padding(
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
      ),
    );
  }
}
