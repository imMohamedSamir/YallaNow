import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/Repo/MartsRepoImpl.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/manager/mart_home_cubit/mart_home_cubit.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketsViewBody.dart';

class MarketsView extends StatelessWidget {
  const MarketsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              MartHomeCubit(getIt.get<MartsRepoImpl>())..getMarts(),
        ),
      ],
      child: Scaffold(
          appBar: categoryAppBar(context, title: "Marts"),
          body: const MarketsViewBody()),
    );
  }
}
