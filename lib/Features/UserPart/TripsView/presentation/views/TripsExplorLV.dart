import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartsLoading.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_card_model.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/explore_trips_cubit.dart/explore_trips_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/ExploreTripsBuilder.dart';

class TripsExploreLv extends StatelessWidget {
  const TripsExploreLv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreTripsCubit, ExploreTripsState>(
      builder: (context, state) {
        if (state is ExploreTripsLoading) {
          return const MartsLoading();
        } else if (state is ExploreTripsSuccess) {
          List<TripCardModel> trips = state.trips;
          return ExploreTripsBuilder(trips: trips);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
