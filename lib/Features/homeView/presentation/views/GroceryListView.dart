import 'package:flutter/material.dart';
import 'package:yallanow/Features/homeView/presentation/views/GroceryItemDetails.dart';

class GroceryListView extends StatelessWidget {
  const GroceryListView({super.key});

  @override
  Widget build(BuildContext context) {
    final double hieght = MediaQuery.of(context).size.height * 0.2354;
    final double width = MediaQuery.of(context).size.width * 0.37;

    return SizedBox(
      height: hieght,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, index) {
          return GroceryItemDetails(
            width: width,
          );
        },
      ),
    );
  }
}
