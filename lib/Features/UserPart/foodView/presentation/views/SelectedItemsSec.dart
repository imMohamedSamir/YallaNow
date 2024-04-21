import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/selectedItemsModel.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/SelectedItemCard.dart';

class SelectedItemsSec extends StatelessWidget {
  const SelectedItemsSec({super.key});
  static List<selectedItemsModel> items = [
    selectedItemsModel(
        name: "Box el combo",
        price: "EGP 400",
        img: Assets.imagesMeal1,
        quantity: "2"),
    selectedItemsModel(
        name: "Box el combo",
        price: "EGP 300",
        img: Assets.imagesMeal2,
        quantity: "1"),
    selectedItemsModel(
        name: "Box el combo",
        price: "EGP 100",
        img: Assets.imagesMeal1,
        quantity: "3")
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          3,
          (index) => Dismissible(
              background: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20.0),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              direction: DismissDirection.endToStart,
              key: UniqueKey(),
              child: SelectedItemCard(selectedItems: items[index]))),
    );
  }
}
