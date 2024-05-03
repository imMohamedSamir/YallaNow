import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/resturant_branch_details/item.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/QytIconButton.dart';

class FoodItemQyt extends StatefulWidget {
  const FoodItemQyt({super.key, this.currentnumber, this.item});
  final int? currentnumber;
  final Item? item;
  @override
  State<FoodItemQyt> createState() => _FoodItemQytState();
}

class _FoodItemQytState extends State<FoodItemQyt> {
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

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QytIconButton(
          icon: Icons.remove,
          color: number == 1
              ? const Color(0xffB20404).withOpacity(0.1)
              : const Color(0xffB20404),
          onTap: () {
            if (number > 1) {
              number--;
              BlocProvider.of<BasketManagerCubit>(context)
                  .changeQty(itemID: widget.item!.itemId!, number: number);
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
          color: const Color(0xffB20404),
          onTap: () {
            number++;
            BlocProvider.of<BasketManagerCubit>(context)
                .changeQty(itemID: widget.item!.itemId!, number: number);
            setState(() {});
          },
        ),
      ],
    );
  }
}
