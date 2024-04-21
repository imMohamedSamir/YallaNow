import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketItemAppBar.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketRelatedProductsSec.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodItemDescription.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ItemPageBottomBar.dart';

class MarketItemPage extends StatelessWidget {
  const MarketItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xffF5F5F5),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MarketItemAppBar(),
              FoodItemDescription(),
              SizedBox(height: 10),
              Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: MarketRelatedProductsSec())
            ],
          ),
        ),
        bottomNavigationBar: ItemPageBottomBar());
  }
}
