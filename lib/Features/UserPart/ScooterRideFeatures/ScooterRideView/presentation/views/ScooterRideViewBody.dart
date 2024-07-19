import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/scooter_request_cubit/UserRidRequestCubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/send_request_cubit/send_request_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/scooter_location_cubit/scooter_location_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/views/ScooterMapBody.dart';
import 'package:yallanow/generated/l10n.dart';

class ScooterRideViewBody extends StatelessWidget {
  const ScooterRideViewBody({super.key, this.fromHome = false});
  final bool fromHome;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fromHome
          ? secondAppBar(context, title: S.of(context).scooterRide)
          : null,
      body: PopScope(
          onPopInvoked: (didPop) {
            BlocProvider.of<ScooterLocationCubit>(context).setInitialState();
            BlocProvider.of<UserRidRequestCubit>(context).setInitialState();
            BlocProvider.of<SendRequestCubit>(context).setInitial();
          },
          canPop: false,
          child: ScooterMapBody(fromHome: fromHome)),
      resizeToAvoidBottomInset: false,
    );
  }
}
