import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/views/SelectedItemCard.dart';

class SelectedItemsSec extends StatelessWidget {
  const SelectedItemsSec({super.key});

  @override
  Widget build(BuildContext context) {
    // final cubit = BlocProvider.of<BasketManagerCubit>(context);
    return BlocBuilder<BasketManagerCubit, BasketManagerState>(
      builder: (context, state) {
        if (state is BasketManagerChange) {
          if (state.items.isEmpty) {
            return Center(
              child: Text(
                "The basket is Empty\nChoose your item",
                style: AppStyles.styleSemiBold16(context),
              ),
            );
          } else {
            return Column(
              children: List.generate(
                  state.items.length,
                  (index) => Dismissible(
                      background: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20.0),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      direction: DismissDirection.endToStart,
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        BlocProvider.of<BasketManagerCubit>(context)
                            .deleteFromBasket(state.items[index].itemID!);
                      },
                      child:
                          SelectedItemCard(selectedItems: state.items[index]))),
            );
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
