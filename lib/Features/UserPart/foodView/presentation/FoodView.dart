import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Repo/FoodRepoImpl.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/popular_food_category_cubit/popular_food_category_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodViewBody.dart';

class FoodView extends StatelessWidget {
  const FoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularFoodCategoryCubit(getIt.get<FoodRepoImpl>())
        ..getPopularFoodCategory(),
      child: Scaffold(
        appBar: categoryAppBar(context, title: 'Food'),
        body: const FoodViewBody(),
      ),
    );
  }
}
