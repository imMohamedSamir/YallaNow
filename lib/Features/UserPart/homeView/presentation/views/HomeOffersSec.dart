import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripPopularLoading.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/home_offers_cubit/home_offers_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/OffersPageView.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/offersSec.dart';

class HomeOffersSec extends StatelessWidget {
  const HomeOffersSec({super.key});

  static List<OfferDetailsModel> offers = [
    OfferDetailsModel(
        title: "30%",
        subtitle: "Friday Offer!",
        description: "Get discount up to 30%",
        img: Assets.imagesBurgerIcon),
    OfferDetailsModel(
        title: "5%",
        subtitle: "Friday Offer!",
        description: "Get discount up to 30%",
        img: Assets.imagesBurgerIcon),
    OfferDetailsModel(
        title: "10%",
        subtitle: "Friday Offer!",
        description: "Get discount up to 30%",
        img: Assets.imagesBurgerIcon),
    OfferDetailsModel(
        title: "20%",
        subtitle: "Friday Offer!",
        description: "Get discount up to 30%",
        img: Assets.imagesBurgerIcon)
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeOffersCubit, HomeOffersState>(
      builder: (context, state) {
        if (state is HomeOffersSuccess && state.offers.isNotEmpty) {
          return SliverPadding(
              padding: const EdgeInsets.only(top: 24),
              sliver: SliverToBoxAdapter(
                child: OffersSec(offers: offers),
              ));
        } else if (state is HomeOffersLoading) {
          return const SliverToBoxAdapter(child: TripPopularLoading());
        } else {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
