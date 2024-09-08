import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/functions/getPadding.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/FakaCard.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/place_order_cubit/place_order_cubit.dart';

class FakaTypes extends StatefulWidget {
  const FakaTypes({super.key});

  @override
  FakaTypesState createState() => FakaTypesState();
}

class FakaTypesState extends State<FakaTypes> {
  int? _selectedChange;
  static List<int> changes = [10, 20, 50, 100, 200];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(60, context),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: changes.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              setState(() {
                _selectedChange = changes[index];
                BlocProvider.of<PlaceOrderCubit>(context)
                    .checkoutdetails
                    .changeAmount = changes[index].toDouble();
              });
            },
            child: Padding(
              padding: getPadding(
                  index: index,
                  lastIndex: changes.length - 1,
                  paddingValue: 16),
              child: FakaCard(
                  change: changes[index],
                  isSelected: _selectedChange == changes[index]),
            ),
          );
        },
      ),
    );
  }
}
