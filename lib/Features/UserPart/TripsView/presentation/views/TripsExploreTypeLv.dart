import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartsLoading.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_card_model.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/trips_by_type_cubit/trips_by_type_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripCard.dart';

class TripsExploreTypeLv extends StatelessWidget {
  const TripsExploreTypeLv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripsByTypeCubit, TripsByTypeState>(
      builder: (context, state) {
        if (state is TripsByTypeSuccess) {
          List<TripCardModel> trips = state.trips;

          return ListView.builder(
            itemCount: trips.length > 5 ? 5 : trips.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: TripCard(
                  trip: trips[index],
                ),
              );
            },
          );
        } else if (state is TripsByTypeLoading) {
          return const MartsLoading();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
