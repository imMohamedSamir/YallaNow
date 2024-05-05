import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/functions/DialogMethode.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ResturantHeaderIcon.dart';

class FoodItemAppBar extends StatelessWidget {
  const FoodItemAppBar({super.key, required this.img, required this.itemId});
  final String img;
  final String itemId;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height * 0.242;
    return Container(
        padding: const EdgeInsets.only(top: 55, left: 16),
        width: width,
        height: height,
        decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(img), fit: BoxFit.fill)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResturantHeaderIcon(
              child: const Icon(Icons.close, size: 21),
              onPressed: () => dialogMethode(context, itemId: itemId),
            ),
          ],
        ));
  }
}
