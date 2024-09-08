import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/ChooseAddress.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/trips_popular_cubit/trips_popular_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/PopulareTripsSec.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/fetch_popular_marts_cubit/fetch_popular_marts_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/fetch_popular_resturants_cubit/fetch_popular_resturants_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/home_offers_cubit/home_offers_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/PopularMartsSec.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/HomeOffersSec.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/SearchBar.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/categorySec.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/popularResturants.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RefreshIndicator(
        color: pKcolor,
        onRefresh: () async {
          BlocProvider.of<TripsPopularCubit>(context).get();
          BlocProvider.of<FetchPopularMartsCubit>(context).get();
          BlocProvider.of<FetchPopularResturantsCubit>(context).getResturants();
          BlocProvider.of<HomeOffersCubit>(context).getHomeOffers();
          checkUserAddresses(context);
        },
        child: const CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.only(top: 12),
              sliver: SliverToBoxAdapter(child: HomeSearchBar()),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 13),
              sliver: SliverToBoxAdapter(child: CategorySec()),
            ),
            HomeOffersSec(),

            SliverPadding(
                padding: EdgeInsets.only(top: 16),
                sliver: SliverToBoxAdapter(child: PopulareTripsSec())),
            PopularResturansSec(),
            PopularMartsSec()

            // SliverToBoxAdapter(child: Expanded(child: SizedBox())),
            // SliverPadding(
            //   padding: EdgeInsets.only(top: 24, bottom: 20),
            //   sliver: SliverToBoxAdapter(child: EverydayRidesSec()),
            // ),
          ],
        ),
      ),
    );
  }
}
