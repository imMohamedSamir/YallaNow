import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/manager/home_market_offers_cubit/home_market_offers_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripPopularLoading.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/offersSec.dart';

class MartsHomeOffers extends StatelessWidget {
  const MartsHomeOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeMarketOffersCubit, HomeMarketOffersState>(
      builder: (context, state) {
        if (state is HomeMarketOffersSuccess && state.offers.isNotEmpty) {
          final offers = state.offers;
          return SliverPadding(
              padding: const EdgeInsets.only(top: 24),
              sliver: SliverToBoxAdapter(
                child: OffersSec(offers: offers),
              ));
        } else if (state is HomeMarketOffersLoading) {
          return const SliverToBoxAdapter(child: TripPopularLoading());
        } else {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
