import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/ExtraTypeModel.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/resturant_branch_details/item.dart';

class ExtarType extends StatefulWidget {
  const ExtarType({Key? key, required this.item}) : super(key: key);
  final Item item;
  @override
  _ExtarTypeState createState() => _ExtarTypeState();
}

class _ExtarTypeState extends State<ExtarType> {
  List<ExtraTypeModel> selectedExtraTypes = [];
  static List<ExtraTypeModel> extraTypes = [
    ExtraTypeModel(type: "Cheese", price: "15.00"),
    ExtraTypeModel(type: "Mustard", price: "20.00"),
    ExtraTypeModel(type: "BBQ sauce", price: "10.00"),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 8),
      child: Column(
        children: extraTypes.map((extraType) {
          return CheckboxListTile(
            activeColor: pKcolor,
            contentPadding: EdgeInsets.zero,
            title: Row(
              children: [
                Text(
                  extraType.type,
                  style: AppStyles.styleRegular16(context)
                      .copyWith(color: scColor),
                ),
                const Spacer(),
                Text(
                  "+ ${extraType.price} EGP",
                  style: AppStyles.styleRegular12(context)
                      .copyWith(color: scColor),
                ),
              ],
            ),
            value: selectedExtraTypes.contains(extraType),
            onChanged: (bool? value) {
              setState(() {
                if (value != null && value) {
                  BlocProvider.of<BasketManagerCubit>(context).chooseExtra(
                      itemID: widget.item.itemId!,
                      extraPrice: extraType.price,
                      extras: selectedExtraTypes);
                  selectedExtraTypes.add(extraType);
                } else {
                  BlocProvider.of<BasketManagerCubit>(context).removeExtra(
                      itemID: widget.item.itemId!,
                      extraPrice: extraType.price,
                      extras: selectedExtraTypes);
                  selectedExtraTypes.remove(extraType);
                }
              });
            },
            controlAffinity: ListTileControlAffinity.trailing,
          );
        }).toList(),
      ),
    );
  }
}
