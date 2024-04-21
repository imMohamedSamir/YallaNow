import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodItemAppBar.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodItemDescription.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodItemSize.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ItemPageBottomBar.dart';

class FoodItemPage extends StatelessWidget {
  const FoodItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xffF5F5F5),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FoodItemAppBar(),
              FoodItemDescription(),
              SizedBox(height: 10),
              FoodItemDetails(title: 'your choice of size:', iseRequired: true),
              SizedBox(height: 10),
              FoodItemDetails(title: "Extra:", iseRequired: false)
            ],
          ),
        ),
        bottomNavigationBar: ItemPageBottomBar());
  }
}
