import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/BasketView.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';

class BasketIconBuilder extends StatelessWidget {
  const BasketIconBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: BlocBuilder<BasketManagerCubit, BasketManagerState>(
        builder: (context, state) {
          if (state is BasketManagerAdd) {
            return Badge(
              label: Text(state.items.length.toString()),
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: Color(0xff240301),
              ),
            );
          } else if (state is BasketManagerDelete) {
            return Badge(
              label: Text(state.items.length.toString()),
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: Color(0xff240301),
              ),
            );
          } else {
            return const Badge(
              label: Text("0"),
              child: Icon(
                Icons.shopping_cart_outlined,
                color: Color(0xff240301),
              ),
            );
          }
        },
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BasketPage()));
      },
    );
  }
}
