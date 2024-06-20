import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/AvailableRideBS.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/scooter_location_cubit/scooter_location_cubit.dart';

class ChooseRideTypeBuilder extends StatelessWidget {
  const ChooseRideTypeBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScooterLocationCubit, ScooterLocationState>(
      builder: (context, state) {
        Offset offset;
        double opacity;

        if (state is ScooterLocationChange && !state.isSent! ||
            state is ScooterLocationFailuer ||
            state is ScooterLocationLoading) {
          offset = const Offset(0, 0);
          opacity = 1.0;
        } else {
          offset = const Offset(0, 1);
          opacity = 0.0;
        }

        return AnimatedSlide(
          offset: offset,
          duration: const Duration(milliseconds: 650),
          child: AnimatedOpacity(
            opacity: opacity,
            duration: const Duration(milliseconds: 650),
            child: const ChooseRideType(),
          ),
        );
      },
    );
  }
}
