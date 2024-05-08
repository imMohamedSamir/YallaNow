import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/restrunt_details/item.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/restrunt_details/size.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ItemSize.dart';

// enum ItemSizes { Medium, Large }

class SizeType extends StatefulWidget {
  const SizeType({super.key, required this.item});
  final Item item;
  @override
  State<SizeType> createState() => _SizeTypeState();
}

class _SizeTypeState extends State<SizeType> {
  ItemSize? selectedSizeType;
  List<ItemSize> sizes = [];
  @override
  void initState() {
    sizes = widget.item.sizes ?? [];
    super.initState();
  }

  // ItemSizes? sizes;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: sizes.map((sizeType) {
        return ItemSelectedDetails(
          mealSize: sizeType.name ?? '',
          prices: sizeType.price.toString(),
          groupValue: selectedSizeType,
          value: sizeType,
          onChanged: (value) {
            setState(() {
              selectedSizeType = value;
              BlocProvider.of<BasketManagerCubit>(context).chooseSize(
                  sizePrice: selectedSizeType!.price.toString(),
                  itemID: widget.item.itemId!);
            });
          },
        );
      }).toList(),
    );
  }
}
