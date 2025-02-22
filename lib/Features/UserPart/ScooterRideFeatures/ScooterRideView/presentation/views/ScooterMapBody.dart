import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/views/CurrentLocationIcon.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/scooter_request_cubit/UserRidRequestCubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/send_request_cubit/send_request_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/scooter_location_cubit/scooter_location_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/views/ChooseRideTypeBuilder.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/views/ScooterRideMap.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/views/SearchCard.dart';

class ScooterMapBody extends StatelessWidget {
  const ScooterMapBody({
    super.key,
    this.fromHome = false,
  });
  final bool fromHome;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ScooterRideMap(),
        // Center(child: Icon(Icons.location_on, size: 32)),
        BlocBuilder<ScooterLocationCubit, ScooterLocationState>(
          builder: (context, state) {
            if (state is ScooterLocationChange) {
              return Positioned(
                top: AppSizes.getHeight(50, context),
                left: 16,
                child: BlocBuilder<UserRidRequestCubit, UserRideRequestState>(
                  builder: (context, state) {
                    if (state is UserRideRequestAccepted) {
                      return const SizedBox();
                    } else {
                      return const MapCloseIcon();
                    }
                  },
                ),
              );
            } else if (state is ScooterLocationLoading) {
              return const SizedBox();
            } else {
              return Positioned(
                  top: AppSizes.getHeight(fromHome ? 12 : 50, context),
                  left: 16,
                  right: 16,
                  child: const SearchCard());
            }
          },
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: CurrentLocationIcon(
            onPressed: () {
              BlocProvider.of<ScooterLocationCubit>(context).updateMyLocation();
            },
          ),
        ),
        const ChooseRideTypeBuilder()
      ],
    );
  }
}

class MapCloseIcon extends StatelessWidget {
  const MapCloseIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: 40,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              BlocProvider.of<ScooterLocationCubit>(context).setInitialState();
              BlocProvider.of<UserRidRequestCubit>(context).setInitialState();
              BlocProvider.of<SendRequestCubit>(context).setInitial();
            },
            icon: const Icon(Icons.close)));
  }
}
