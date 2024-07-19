import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/Repos/ScooterRequestRepoImpl.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/scooter_rating_cubit/scooter_rating_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/ScooterRatingBody.dart';

class ScooterRatingPage extends StatelessWidget {
  const ScooterRatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ScooterRatingCubit(getIt.get<ScooterRequestRepoImpl>()),
      child: const Scaffold(
        body: ScooterRatingBody(),
      ),
    );
  }
}
