import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/views/BasketButtonsSec.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/views/BasketViewBody.dart';
import 'package:yallanow/generated/l10n.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondAppBar(context, title: S.of(context).Basket),
      body: const BasketViewBody(),
      bottomNavigationBar: const BasketButtonsSec(),
    );
  }
}
