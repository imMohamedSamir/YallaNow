import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/Repo/MartsRepoImpl.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/manager/market_offer_cubit/market_offer_cubit.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/manager/mart_details_cubit/mart_details_cubit.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/manager/mart_discount_cubit/mart_discount_cubit.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/manager/mart_items_cubit/mart_items_cubit.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/manager/mart_trending_items_cubit/mart_trending_items_cubit.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketPageBody.dart';
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
        BlocProvider(
          create: (context) =>
              MarketOfferCubit(getIt.get<MartsRepoImpl>())..get(),
        ),
        BlocProvider(
          create: (context) =>
              MartTrendingItemsCubit(getIt.get<MartsRepoImpl>())..get(),
        ),
        BlocProvider(
          create: (context) =>
              MartDiscountCubit(getIt.get<MartsRepoImpl>())..get(),
        ),
      ],
      child: Scaffold(
        appBar: categoryAppBar(context, title: martName ?? ''),
        body: const MarketPageBody(),
        bottomSheet: const FoodBottomBarTest(),
      ),
    );
  }
}
