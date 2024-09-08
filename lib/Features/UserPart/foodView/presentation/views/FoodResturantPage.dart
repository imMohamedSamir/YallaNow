import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Repo/FoodRepoImpl.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/food_resturant_page_cubit/food_resturant_page_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/ResturantDetailsCubit/ResturantDetailsCubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodBottomBar.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodResturantPageBody.dart';

class FoodResturantPage extends StatelessWidget {
  const FoodResturantPage(
      {super.key, this.deliveryTime, this.deliveryPrice, required this.id});
  final String? deliveryTime, deliveryPrice;
  final String id;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FoodResturantPageCubit()..scrollUpdate(),
        ),
        BlocProvider(
          create: (context) => ResturantDetailsCubit(getIt.get<FoodRepoImpl>())
            ..get(restaurantId: id),
        ),
      ],
      child: Scaffold(
        body: FoodResturantPageBody(
            deliveryPrice: deliveryPrice, deliveryTime: deliveryTime!),
        bottomNavigationBar: const FoodBottomBarTest(),
      ),
    );
  }
}
