import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/resturant_branch_details/item.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodItemAppBar.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodItemDescription.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodItemSize.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ItemPageBottomBar.dart';

class FoodItemPage extends StatelessWidget {
  const FoodItemPage({super.key, this.item});
  final Item? item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FoodItemAppBar(
                img: item!.itemImageUrl!,
              ),
              FoodItemDescription(item: item),
              const SizedBox(height: 10),
              const FoodItemDetails(
                  title: 'your choice of size:', iseRequired: true),
              const SizedBox(height: 10),
              const FoodItemDetails(title: "Extra:", iseRequired: false)
            ],
          ),
        ),
        bottomNavigationBar: const ItemPageBottomBar());
  }
}
