import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/manager/market_offer_cubit/market_offer_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripPopularLoading.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/offersSec.dart';

class MarketsOffersSec extends StatelessWidget {
  const MarketsOffersSec({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketOfferCubit, MarketOfferState>(
      builder: (context, state) {
        if (state is MarketOfferSuccess && state.offers.isNotEmpty) {
          final offers = state.offers;
          return SliverPadding(
              padding: const EdgeInsets.only(top: 24),
              sliver: SliverToBoxAdapter(
                child: OffersSec(offers: offers),
              ));
        } else if (state is MarketOfferLoading) {
          return const SliverToBoxAdapter(child: TripPopularLoading());
        } else {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
