import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/CheckOutPage.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';
import 'package:yallanow/generated/l10n.dart';

class BasketButtonsSec extends StatelessWidget {
  const BasketButtonsSec({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<SelectedItemsModel>(kBasket);

    return ValueListenableBuilder(
      valueListenable: box.listenable(),
      builder: (context, box, _) {
        final items = box.values.toList();

        if (items.isEmpty) {
          return const SizedBox.shrink();
        } else {
          // final cubit = BlocProvider.of<BasketManagerCubit>(context);
          // cubit.getCurrentItems();

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: CustomButton(
              text: S.of(context).Checkout,
              txtcolor: Colors.white,
              btncolor: pKcolor,
              onPressed: () {
                NavigateToPage.slideFromRight(
                    context: context, page: const CheckOutPage());
              },
            ),
          );
        }
      },
    );
  }
}
