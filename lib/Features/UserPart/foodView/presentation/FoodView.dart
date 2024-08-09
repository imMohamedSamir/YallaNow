import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Repo/FoodRepoImpl.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/explore_resturants_cubit/explore_resturants_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/popular_food_category_cubit/popular_food_category_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodViewBody.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Repo/HomeRepoImpl.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/fetch_popular_resturants_cubit/fetch_popular_resturants_cubit.dart';
import 'package:yallanow/generated/l10n.dart';

class FoodView extends StatelessWidget {
  const FoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ExploreResturantsCubit(getIt.get<FoodRepoImpl>())..get(),
        ),
        BlocProvider(
          create: (context) =>
              PopularFoodCategoryCubit(getIt.get<FoodRepoImpl>())
                ..getPopularFoodCategory(),
        ),
        BlocProvider(
          create: (context) =>
              FetchPopularResturantsCubit(getIt.get<HomeRepoImpl>()),
        ),
      ],
      child: Scaffold(
        appBar: categoryAppBar(context, title: S.of(context).Food),
        body: const FoodViewBody(),
      ),
    );
  }
}
