import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/SignUpAppBar.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Repo/HomeRepoImpl.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/home_search_cubit/home_search_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/HomeSearchPageBody.dart';

class HomeSearchPage extends StatelessWidget {
  const HomeSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeSearchCubit(getIt.get<HomeRepoImpl>()),
      child: Scaffold(
        appBar: customAppBar(context, title: "Home", onPressed: () {
          Navigator.pop(context);
        }),
        body: const HomeSearchPageBody(),
      ),
    );
  }
}
