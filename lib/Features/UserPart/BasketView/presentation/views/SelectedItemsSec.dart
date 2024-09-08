import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yallanow/Core/utlis/AppLang.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/views/SelectedItemCard.dart';

class SelectedItemsSec extends StatelessWidget {
  const SelectedItemsSec({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<BasketManagerCubit>(context);
    final box = Hive.box<SelectedItemsModel>(kBasket);

    return SingleChildScrollView(
      child: Column(
        children: [
          for (var item in box.values.toList())
            Dismissible(
              background: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20.0),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              direction: AppLang.isArabic()
                  ? DismissDirection.startToEnd
                  : DismissDirection.endToStart,
              key: UniqueKey(),
              onDismissed: (direction) {
                cubit.deleteFromBasket(item.itemID!);
              },
              child: SelectedItemCard(selectedItems: item),
            ),
        ],
      ),
    );
  }
}
