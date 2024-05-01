import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';

class ItemPageBottomBar extends StatelessWidget {
  const ItemPageBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return ListTile(
      onTap: () {
        BlocProvider.of<BasketManagerCubit>(context).addToBasket(
            item: SelectedItemsModel(
                name: "2", price: "15", img: "", quantity: "2"),
            itemID: "1");
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      title: Container(
        height: height * 0.065,
        width: width * 0.91,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xffB20404),
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Text(
              "Add to basket",
              style: AppStyles.styleMedium16(context)
                  .copyWith(color: Colors.white),
            ),
            const Spacer(),
            BlocBuilder<BasketManagerCubit, BasketManagerState>(
              builder: (context, state) {
                return Text(
                  state is BasketManagerSize
                      ? state.sizePrice
                      : "Price on selection",
                  style: AppStyles.styleMedium16(context)
                      .copyWith(color: Colors.white),
                );
              },
            ),
          ],
        ),
      ),
      tileColor: Colors.white,
    );
  }
}
