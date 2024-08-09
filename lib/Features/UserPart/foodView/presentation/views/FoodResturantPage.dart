import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Repo/FoodRepoImpl.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/food_resturant_page_cubit/food_resturant_page_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/resturant_branches_cubit/resturant_branches_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodBottomBar.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodResturantPageBody.dart';

class FoodResturantPage extends StatelessWidget {
  const FoodResturantPage(
      {super.key,
      this.deliveryTime,
      this.deliveryPrice,
      this.resurantName,
      this.returantImg,
      required this.id});
  final String? deliveryTime, deliveryPrice, resurantName, returantImg;
  final String id;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FoodResturantPageCubit()..scrollUpdate(),
        ),
        BlocProvider(
          create: (context) => ResturantBranchesCubit(getIt.get<FoodRepoImpl>())
            ..fetchResturantBranches(
                restaurantId: "50654f1b-ea1d-4841-8788-1d68c20091bd"),
        ),
      ],
      child: Scaffold(
        body: FoodResturantPageBody(
          deliveryPrice: deliveryPrice,
          deliveryTime: deliveryTime!,
          returantImg: returantImg!,
          resurantName: resurantName!,
          partnerId: id,
        ),
        bottomNavigationBar: const FoodBottomBarTest(),
      ),
    );
  }
}
