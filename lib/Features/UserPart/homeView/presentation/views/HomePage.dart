import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrader/upgrader.dart';
import 'package:yallanow/Core/utlis/Google_Api_services.dart';
import 'package:yallanow/Core/utlis/functions/UpgradeMethods.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/Repo/TripsRepoImpl.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/explore_trips_cubit.dart/explore_trips_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/trips_popular_cubit/trips_popular_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/HomePageBody.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TripsPopularCubit(
              getIt.get<TripsRepoImpl>(), getIt.get<GoogleMapsServices>())
            ..get(),
        ),
        BlocProvider(
          create: (context) => ExploreTripsCubit(
              getIt.get<TripsRepoImpl>(), getIt.get<GoogleMapsServices>())
            ..get(),
        ),
      ],
      child: UpgradeAlert(
        // showLater: false,
        showIgnore: false,
        upgrader: upgrader(),
        onUpdate: () {
          updateLink().then((value) {
            return value;
          });
          return false;
        },
        child: Scaffold(
          appBar: homeAppBar(),
          body: const HomePageBody(),
        ),
      ),
    );
  }
}
