import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/item_page_cubit/item_page_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/restrunt_details/item.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodItemAppBar.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodItemDescription.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodItemExtras.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodItemSize.dart';

class FoodItemPageBody extends StatelessWidget {
  const FoodItemPageBody({
    super.key,
    required this.item,
  });

  final FoodItem? item;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ItemPageCubit>(context).createItem(
        itemsModel: SelectedItemsModel(
            itemID: item!.itemId,
            partnerType: 2,
            name: item!.itemName!,
            price: item!.itemPrice.toString(),
            img: item!.itemImageUrl!));
    return SingleChildScrollView(
      child: Column(
        children: [
          FoodItemAppBar(
            itemId: item!.itemId!,
            img: item!.itemImageUrl!,
          ),
          FoodItemDescription(item: item),
          const SizedBox(height: 10),
          if (item!.sizes?.isNotEmpty ?? false) FoodItemSize(item: item!),
          const SizedBox(height: 10),
          if (item!.extras?.isNotEmpty ?? false) FoodItemExtras(item: item!)
        ],
      ),
    );
  }
}
