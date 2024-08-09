import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/Repo/MartsRepoImpl.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/manager/marts_search_cubit/marts_search_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/MartSearchPageBody.dart';
import 'package:yallanow/generated/l10n.dart';

class MartSearchPage extends StatelessWidget {
  const MartSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MartsSearchCubit(getIt.get<MartsRepoImpl>()),
      child: Scaffold(
        appBar: secondAppBar(context, title: S.of(context).marts),
        body: const MartSearchPageBody(),
      ),
    );
  }
}
