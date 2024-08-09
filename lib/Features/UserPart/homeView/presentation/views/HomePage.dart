import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/Google_Api_services.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/Repo/TripsRepoImpl.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/trips_popular_cubit/trips_popular_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Repo/HomeRepoImpl.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/fetch_popular_marts_cubit/fetch_popular_marts_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/fetch_popular_resturants_cubit/fetch_popular_resturants_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/home_offers_cubit/home_offers_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/HomePageBody.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
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
            create: (context) =>
                FetchPopularMartsCubit(getIt.get<HomeRepoImpl>())..get()),
        BlocProvider(
            create: (context) =>
                FetchPopularResturantsCubit(getIt.get<HomeRepoImpl>())
                  ..getResturants()),
        BlocProvider(
            create: (context) =>
                HomeOffersCubit(getIt.get<HomeRepoImpl>())..getHomeOffers()),
      ],
      child: Scaffold(
        appBar: homeAppBar(),
        body: const HomePageBody(),
      ),
    );
  }
}
