import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/BasketView.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';

class BasketIconBuilder extends StatelessWidget {
  const BasketIconBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<SelectedItemsModel>(kBasket);
    final cubit = BlocProvider.of<BasketManagerCubit>(context);

    return ValueListenableBuilder(
      valueListenable: box.listenable(),
      builder: (context, box, _) {
        final items = box.values.toList();
        for (var item in items) {
          if (int.parse(item.quantity ?? "") == 0) {
            item.delete();
            cubit.deleteFromBasket(item.itemID!);
          }
        }
        return IconButton(
          icon: items.isEmpty
              ? const Icon(
                  Icons.shopping_cart_outlined,
                  color: Color(0xff240301),
                )
              : Badge(
                  label: Text(items.length.toString()),
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Color(0xff240301),
                  ),
                ),
          onPressed: () {
            NavigateToPage.slideFromRight(
                context: context, page: const BasketPage());
          },
        );
      },
    );
  }
}
