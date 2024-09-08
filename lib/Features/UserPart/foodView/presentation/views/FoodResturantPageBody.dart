import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/food_resturant_page_cubit/food_resturant_page_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodResturantCategoryTabBar.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodResturantSecondAppBar.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ResturantDescription.dart';

class FoodResturantPageBody extends StatelessWidget {
  const FoodResturantPageBody({
    super.key,
    this.deliveryTime,
    this.deliveryPrice,
  });
  final String? deliveryTime, deliveryPrice;

  @override
  Widget build(BuildContext context) {
    final scrollController =
        BlocProvider.of<FoodResturantPageCubit>(context).scrollController;
    return CustomScrollView(
      controller: scrollController,
      slivers: <Widget>[
        const FoodResturantSecondAppBar(),
        SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
                child: ResturantDescription(
                    deliveryPrice: deliveryPrice, deliveryTime: deliveryTime))),
        SliverToBoxAdapter(
            child: FoodResturantCategoryTabBar(
                scrollController: scrollController)),
      ],
    );
  }
}
