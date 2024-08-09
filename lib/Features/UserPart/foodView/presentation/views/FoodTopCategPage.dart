import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Repo/FoodRepoImpl.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/top_categ_resturant_cubit/top_categ_resturant_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodTopCategBody.dart';
import 'package:yallanow/generated/l10n.dart';

class FoodTopCategPage extends StatelessWidget {
  const FoodTopCategPage(
      {super.key, required this.categTitle, required this.categID});
  final String categTitle, categID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopCategResturantCubit(getIt.get<FoodRepoImpl>()),
      child: Scaffold(
        appBar: categoryAppBar(context, title: S.of(context).Food),
        body: FoodTopCategBody(categTitle: categTitle, categID: categID),
      ),
    );
  }
}
