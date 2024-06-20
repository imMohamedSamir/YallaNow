import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartsLoading.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_card_model.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/place_trips_cubit/place_trips_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripCard.dart';

class TripsExplorePlaceLv extends StatelessWidget {
  const TripsExplorePlaceLv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaceTripsCubit, PlaceTripsState>(
      builder: (context, state) {
        if (state is PlaceTripsSuccess) {
          List<TripCardModel> trips = state.trips;

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              final offsetAnimation = state.direction ==
                      AnimationDirection.forward
                  ? Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                      .animate(animation)
                  : Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
                      .animate(animation);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
            child: ListView.builder(
              key: ValueKey<int>(state.currentPage),
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
            ),
          );
        } else if (state is PlaceTripsLoading) {
          return const MartsLoading();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
