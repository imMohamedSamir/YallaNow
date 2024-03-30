import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Features/homeView/presentation/views/GroceryItemDetails.dart';

class GroceryListView extends StatelessWidget {
  const GroceryListView({super.key});

  @override
  Widget build(BuildContext context) {
    // final double hieght = MediaQuery.of(context).size.height * 0.2354;
    // final double width = MediaQuery.of(context).size.width * 0.37;

    return SizedBox(
      height: AppSizes.getHeight(203, context),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GroceryItemDetails(),
          );
        },
      ),
    );
  }
}
