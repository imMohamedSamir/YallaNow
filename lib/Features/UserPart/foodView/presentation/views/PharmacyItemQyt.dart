import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/item_page_cubit/item_page_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/QytIconButton.dart';

class PharmacyItemQyt extends StatefulWidget {
  const PharmacyItemQyt({super.key, this.currentnumber, this.itemId});
  final int? currentnumber;
  final String? itemId;
  // final SelectedItemsModel? item2;
  @override
  State<PharmacyItemQyt> createState() => _FoodItemQytState();
}

class _FoodItemQytState extends State<PharmacyItemQyt> {
  int number = 1;
  void quantityMethod() {
    if (widget.currentnumber != null) {
      number = widget.currentnumber!;
    }
  }

  @override
  void initState() {
    quantityMethod();
    super.initState();
  }

  void changeqtyMethod({required int qty, bool add = true}) {
    if (widget.itemId != null) {
      BlocProvider.of<ItemPageCubit>(context)
          .changeQty(itemID: widget.itemId!, number: qty, add: add);
    }
    // } else {
    //   BlocProvider.of<BasketManagerCubit>(context)
    //       .changeQty(itemID: widget.itemId!, number: qty);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QytIconButton(
          icon: Icons.remove,
          color: number == 1 ? pKcolor.withOpacity(0.1) : pKcolor,
          onTap: () {
            if (number > 1) {
              number--;
              changeqtyMethod(qty: number, add: false);

              setState(() {});
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            number.toString(),
            style: AppStyles.styleBold18(context)
                .copyWith(color: const Color(0xff240301)),
          ),
        ),
        QytIconButton(
          icon: Icons.add,
          color: pKcolor,
          onTap: () {
            number++;
            changeqtyMethod(qty: number, add: true);

            setState(() {});
          },
        ),
      ],
    );
  }
}
