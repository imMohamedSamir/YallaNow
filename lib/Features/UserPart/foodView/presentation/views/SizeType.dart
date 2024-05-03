import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/ExtraTypeModel.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/resturant_branch_details/item.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ItemSize.dart';

// enum ItemSizes { Medium, Large }

class SizeType extends StatefulWidget {
  const SizeType({super.key, required this.item});
  final Item item;
  @override
  State<SizeType> createState() => _SizeTypeState();
}

class _SizeTypeState extends State<SizeType> {
  SizeModel? selectedSizeType;
  static List<SizeModel> sizes = [
    SizeModel(size: "Medium meal", price: "120.00"),
    SizeModel(size: "Large meal", price: "200.00"),
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
              BlocProvider.of<BasketManagerCubit>(context).chooseSize(
                  sizePrice: selectedSizeType!.price,
                  itemID: widget.item.itemId!);
            });
          },
        );
      }).toList(),
    );
  }
}
