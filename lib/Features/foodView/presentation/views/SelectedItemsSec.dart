import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/foodView/data/Models/selectedItemsModel.dart';
import 'package:yallanow/Features/foodView/presentation/views/SelectedItemCard.dart';

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
          3, (index) => SelectedItemCard(selectedItems: items[index])),
    );
  }
}
