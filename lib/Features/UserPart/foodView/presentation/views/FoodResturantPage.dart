import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/food_resturant_page_cubit/food_resturant_page_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodBottomBar.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodResturantPageBody.dart';

class FoodResturantPage extends StatelessWidget {
  const FoodResturantPage(
      {super.key,
      this.deliveryTime,
      this.deliveryPrice,
      this.resurantName,
      this.returantImg});
  final String? deliveryTime, deliveryPrice, resurantName, returantImg;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodResturantPageCubit()..scrollUpdate(),
      child: Scaffold(
        body: FoodResturantPageBody(
            deliveryPrice: deliveryPrice,
            deliveryTime: deliveryTime!,
            returantImg: returantImg!,
            resurantName: resurantName!),
        bottomNavigationBar: const FoodBottomBar(),
      ),
    );
  }
}
