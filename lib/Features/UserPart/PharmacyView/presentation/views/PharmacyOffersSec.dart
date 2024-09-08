import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/manager/pharmacy_offers_cubit/pharmacy_offers_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripPopularLoading.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/OfferDetailsModel.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/offersSec.dart';

class PharmacyOffersSec extends StatelessWidget {
  const PharmacyOffersSec({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PharmacyOffersCubit, PharmacyOffersState>(
      builder: (context, state) {
        if (state is PharmacyOffersSuccess && state.offers.isNotEmpty) {
          final offers = state.offers;
          return SliverPadding(
              padding: const EdgeInsets.only(top: 12),
              sliver: SliverToBoxAdapter(
                child: OffersSec(offers: offers),
              ));
        } else if (state is PharmacyOffersLoading) {
          return const SliverToBoxAdapter(child: TripPopularLoading());
        } else {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
