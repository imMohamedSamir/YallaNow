import 'package:flutter/material.dart';
import 'package:yallanow/Features/foodView/data/Models/ExtraTypeModel.dart';
import 'package:yallanow/Features/foodView/presentation/views/ItemSize.dart';

// enum ItemSizes { Medium, Large }

class SizeType extends StatefulWidget {
  const SizeType({super.key});

  @override
  State<SizeType> createState() => _SizeTypeState();
}

class _SizeTypeState extends State<SizeType> {
  SizeModel? selectedSizeType;
  static List<SizeModel> sizes = [
    SizeModel(size: "Medium meal", price: "+ EGP 100.00"),
    SizeModel(size: "Large meal", price: "+ EGP 100.00"),
  ];

  // ItemSizes? sizes;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: sizes.map((sizeType) {
        return ItemSelectedDetails(
          mealSize: sizeType.size,
          prices: sizeType.price,
          groupValue: selectedSizeType,
          value: sizeType,
          onChanged: (value) {
            setState(() {
              selectedSizeType = value;
            });
          },
        );
      }).toList(),
    );
  }
}
