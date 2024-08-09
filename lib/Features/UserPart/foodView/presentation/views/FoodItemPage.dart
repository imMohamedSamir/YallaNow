import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/item_page_cubit/item_page_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/restrunt_details/item.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodItemPageBody.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ItemPageBottomBar.dart';

class FoodItemPage extends StatelessWidget {
  const FoodItemPage({super.key, this.item});
  final FoodItem? item;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BasketManagerCubit>(context).sizeSelected = false;

    return BlocProvider(
      create: (context) => ItemPageCubit(),
      child: Scaffold(
          backgroundColor: const Color(0xffF5F5F5),
          body: FoodItemPageBody(item: item),
          bottomNavigationBar: ItemPageBottomBar(itemId: item?.itemId)),
    );
  }
}
