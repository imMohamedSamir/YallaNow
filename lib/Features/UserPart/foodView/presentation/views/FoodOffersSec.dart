import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripPopularLoading.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/food_offers_cubit/food_offers_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/offersSec.dart';

class FoodOffersSec extends StatelessWidget {
  const FoodOffersSec({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodOffersCubit, FoodOffersState>(
      builder: (context, state) {
        if (state is FoodOffersSuccess && state.offers.isNotEmpty) {
          final offers = state.offers;
          return SliverPadding(
              padding: const EdgeInsets.only(top: 12),
              sliver: SliverToBoxAdapter(
                child: OffersSec(offers: offers),
              ));
        } else if (state is FoodOffersLoading) {
          return const SliverToBoxAdapter(child: TripPopularLoading());
        } else {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
