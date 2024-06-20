import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppLang.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_popular_model.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/trips_popular_cubit/trips_popular_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripPopularLoading.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripsPopularCard.dart';

class TripsPopularLV extends StatelessWidget {
  const TripsPopularLV({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(145, context),
      child: BlocBuilder<TripsPopularCubit, TripsPopularState>(
        builder: (context, state) {
          if (state is TripsPopularSuccess) {
            List<PopularTripModel> trips = state.trips;
            return ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: trips.length,
              itemBuilder: (context, index) {
                final last = trips.length - 1 == index;
                return Padding(
                  padding: EdgeInsets.only(
                      right: last ? 0 : 12,
                      left: last
                          ? 0
                          : AppLang.isArabic()
                              ? 12
                              : 0),
                  child: TripsPopularCard(trip: trips[index]),
                );
              },
            );
          } else if (state is TripsPopularLoading) {
            return const TripPopularLoading();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
