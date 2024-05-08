import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/ExtraTypeModel.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/restrunt_details/extra.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/restrunt_details/item.dart';

class ExtarType extends StatefulWidget {
  const ExtarType({Key? key, required this.item}) : super(key: key);
  final Item item;
  @override
  _ExtarTypeState createState() => _ExtarTypeState();
}

class _ExtarTypeState extends State<ExtarType> {
  List<Extra> selectedExtraTypes = [];
  List<Extra> extraTypes = [];
  @override
  void initState() {
    extraTypes = widget.item.extras ?? [];

    super.initState();
  }

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
                  extraType.name ?? '',
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
                      extraPrice: extraType.price.toString(),
                      extras: selectedExtraTypes);
                  selectedExtraTypes.add(extraType);
                } else {
                  BlocProvider.of<BasketManagerCubit>(context).removeExtra(
                      itemID: widget.item.itemId!,
                      extraPrice: extraType.price.toString(),
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
