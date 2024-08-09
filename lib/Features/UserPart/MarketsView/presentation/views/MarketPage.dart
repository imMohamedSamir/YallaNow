import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/Repo/MartsRepoImpl.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/manager/mart_details_cubit/mart_details_cubit.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/manager/mart_items_cubit/mart_items_cubit.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartPageBody.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodBottomBar.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({super.key, this.martName, this.martID});
  final String? martName;
  final String? martID;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MartDetailsCubit(getIt.get<MartsRepoImpl>())
            ..getMartsDetails(martID: martID!),
        ),
        BlocProvider(
          create: (context) =>
              MartItemsCubit(getIt.get<MartsRepoImpl>())..getItems(),
        ),
      ],
      child: Scaffold(
        appBar: categoryAppBar(context, title: martName ?? ''),
        body: const MartPageBody(),
        bottomSheet: const FoodBottomBarTest(),
      ),
    );
  }
}
