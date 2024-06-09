import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/item_page_cubit/item_page_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/restrunt_details/item.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/SizeType.dart';

class FoodItemSize extends StatelessWidget {
  const FoodItemSize({super.key, required this.item});
  final FoodItem item;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.only(top: 24, left: 0, right: 16, bottom: 16),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 16),
              Text("your choice of size:",
                  style: AppStyles.styleSemiBold16(context)
                      .copyWith(color: const Color(0xff240301))),
              const Spacer(),
              Container(
                width: width * 0.1999,
                height: height * 0.0278,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: ShapeDecoration(
                  color: const Color(0xFFFFD8CF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child:
                    Text('Required', style: AppStyles.styleMedium10(context)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          BlocBuilder<ItemPageCubit, ItemPageState>(
            builder: (context, state) {
              if (state is ItemPageChange) {
                if (!state.selectedSize) {
                  return Row(
                    children: [
                      const SizedBox(width: 16),
                      const Icon(Icons.warning_amber_rounded,
                          color: pKcolor, size: 18),
                      const SizedBox(width: 8),
                      Text(
                        "Choose 1",
                        style: AppStyles.styleMedium12(context)
                            .copyWith(color: pKcolor),
                      )
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              } else {
                return const SizedBox();
              }
            },
          ),
          const SizedBox(height: 16),
          SizeType(
            item: item,
          ),
        ],
      ),
    );
  }
}
