import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/resturant_branch_details/item.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodItemAppBar.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodItemDescription.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodItemExtras.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodItemSize.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ItemPageBottomBar.dart';

class FoodItemPage extends StatelessWidget {
  const FoodItemPage({super.key, this.item});
  final Item? item;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BasketManagerCubit>(context).sizeSelected = false;
    BlocProvider.of<BasketManagerCubit>(context).createItem(
        itemsModel: SelectedItemsModel(
            itemID: item!.itemId,
            name: item!.itemName!,
            price: item!.itemPrice.toString(),
            img: item!.itemImageUrl!));
    return Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FoodItemAppBar(
                img: item!.itemImageUrl!,
              ),
              FoodItemDescription(item: item),
              const SizedBox(height: 10),
              FoodItemSize(item: item!),
              const SizedBox(height: 10),
              FoodItemExtras(item: item!)
            ],
          ),
        ),
        bottomNavigationBar: ItemPageBottomBar(item: item!));
  }
}
