import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/restrunt_details/item.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodItemPage.dart';

class ResturantCategCard extends StatelessWidget {
  const ResturantCategCard({super.key, required this.item});
  final FoodItem item;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigateToPage.slideFromBottom(
            context: context, page: FoodItemPage(item: item));
        BlocProvider.of<BasketManagerCubit>(context).unitPrice =
            item.itemPrice!;
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.itemName!,
                          style: AppStyles.styleMedium16(context)
                              .copyWith(color: const Color(0xff121212))),
                      const SizedBox(height: 4),
                      SizedBox(
                          width: AppSizes.getWidth(220, context),
                          child: Text(
                            item.itemDescription!,
                            style: AppStyles.styleRegular12(context)
                                .copyWith(color: const Color(0xff898989)),
                          )),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            "${item.itemPrice} EGP",
                            style: AppStyles.styleRegular10(context)
                                .copyWith(color: const Color(0xffB20404)),
                          ),
                          const SizedBox(width: 16),
                        ],
                      )
                    ],
                  ),
                  Expanded(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(item.itemImageUrl!)))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
