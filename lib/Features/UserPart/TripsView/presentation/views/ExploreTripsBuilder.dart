import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_card_model.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripCard.dart';

class ExploreTripsBuilder extends StatelessWidget {
  const ExploreTripsBuilder({
    super.key,
    required this.trips,
  });

  final List<TripCardModel> trips;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: trips.length > 5 ? 8 : trips.length,
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
  }
}
