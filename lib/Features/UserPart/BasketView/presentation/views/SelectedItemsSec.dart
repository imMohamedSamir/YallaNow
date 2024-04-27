import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/views/SelectedItemCard.dart';

class SelectedItemsSec extends StatelessWidget {
  const SelectedItemsSec({super.key});
  static List<SelectedItemsModel> items = [
    SelectedItemsModel(
        name: "Box el combo",
        price: "EGP 400",
        img: Assets.imagesMeal1,
        quantity: "2"),
    SelectedItemsModel(
        name: "Box el combo",
        price: "EGP 300",
        img: Assets.imagesMeal2,
        quantity: "1"),
    SelectedItemsModel(
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
