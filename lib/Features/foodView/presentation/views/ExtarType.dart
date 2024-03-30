import 'package:flutter/material.dart';
import 'package:yallanow/Features/foodView/data/Models/ExtraTypeModel.dart';
import 'package:yallanow/Features/foodView/presentation/views/ItemSize.dart';

class ExtarType extends StatefulWidget {
  const ExtarType({Key? key}) : super(key: key);

  @override
  _ExtarTypeState createState() => _ExtarTypeState();
}

class _ExtarTypeState extends State<ExtarType> {
  ExtraTypeModel? selectedExtraType;
  static List<ExtraTypeModel> extraTypes = [
    ExtraTypeModel(type: "Cheese", price: "+ EGP 15.00"),
    ExtraTypeModel(type: "Mustard", price: "+ EGP 15.00"),
    ExtraTypeModel(type: "BBQ sauce", price: "+ EGP 15.00"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: extraTypes.map((extraType) {
        return ItemSelectedDetails(
          mealSize: extraType.type,
          prices: extraType.price,
          groupValue: selectedExtraType,
          value: extraType,
          onChanged: (value) {
            setState(() {
              selectedExtraType = value;
            });
          },
        );
      }).toList(),
    );
  }
}
