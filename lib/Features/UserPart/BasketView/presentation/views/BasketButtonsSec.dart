import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/CheckOutPage.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/add_basket_cubit/add_basket_cubit.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';

class BasketButtonsSec extends StatelessWidget {
  const BasketButtonsSec({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<BasketManagerCubit>(context);
    cubit.getCurrentItems();
    List<SelectedItemsModel> basketItems = cubit.items;
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            isBasket: true,
            text: "Add items",
            txtcolor: const Color(0xffB20404),
            btncolor: Colors.white,
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const FoodResturantPage(),
              //     ));
            },
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: CustomButton(
            text: "Checkout",
            txtcolor: Colors.white,
            btncolor: const Color(0xffB20404),
            onPressed: () {
              NavigateToPage.slideFromRight(
                  context: context, page: const CheckOutPage());
              BlocProvider.of<AddBasketCubit>(context).add(items: basketItems);
            },
          ),
        )
      ],
    );
  }
}
