import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Repo/FoodRepoImpl.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/food_search_cubit/food_search_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodSearchPageBody.dart';
import 'package:yallanow/generated/l10n.dart';

class FoodSearchPage extends StatelessWidget {
  const FoodSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodSearchCubit(getIt.get<FoodRepoImpl>()),
      child: Scaffold(
        appBar: secondAppBar(context, title: S.of(context).Food),
        body: const FoodSearchPageBody(),
      ),
    );
  }
}
