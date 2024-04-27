import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/SignUpAppBar.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/views/BasketViewBody.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: basketCustomAppBar(context, title: "Basket", onPressed: () {
        Navigator.pop(context);
      }),
      body: const BasketViewBody(),
    );
  }
}
