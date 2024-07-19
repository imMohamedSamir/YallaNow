import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinOrdersView/data/models/driver_trips_model/ride_history.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinOrdersView/presentation/manager/captin_trips_cubit/captin_trips_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinOrdersView/presentation/views/CaptinOrderCard.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinOrdersView/presentation/views/LoadingCaptinTrips.dart';

class CaptinOrdersViewBody extends StatelessWidget {
  const CaptinOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CaptinTripsCubit, CaptinTripsState>(
      builder: (context, state) {
        if (state is CaptinTripsSuccess) {
          List<RideHistory> trips = state.captinTripsModel.rideHistory!;
          return ListView.builder(
            itemCount: trips.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CaptinOrderCard(
                  rideHistory: trips[index],
                ),
              );
            },
          );
        } else if (state is CaptinTripsLoading) {
          return const LoadingCaptinTrips();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
