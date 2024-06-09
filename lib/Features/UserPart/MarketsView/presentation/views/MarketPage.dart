import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/item_page_cubit/item_page_cubit.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/Repo/MartsRepoImpl.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/manager/mart_details_cubit/mart_details_cubit.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartPageBody.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({super.key, this.martName, this.martID});
  final String? martName;
  final String? martID;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ItemPageCubit(),
        ),
        BlocProvider(
          create: (context) => MartDetailsCubit(getIt.get<MartsRepoImpl>())
            ..getMartsDetails(martID: martID!),
        ),
      ],
      child: Scaffold(
        appBar: categoryAppBar(context, title: martName ?? ''),
        body: const MartPageBody(),
      ),
    );
  }
}
