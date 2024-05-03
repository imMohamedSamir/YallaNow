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
    return BlocBuilder<BasketManagerCubit, BasketManagerState>(
      builder: (context, state) {
        return IconButton(
          icon: Badge(
            label: Text(state is BasketManagerAdd
                ? state.items.length.toString()
                : "0"),
            child: const Icon(
              Icons.shopping_cart_outlined,
              color: Color(0xff240301),
            ),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BasketPage()));
          },
        );
      },
    );
  }
}
