import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/location_service.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/views/CaptinMapBody.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryRequestView/presentation/manager/delivery_map_cubit/delivery_map_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/functions/RoutesUtlis.dart';

class CaptinMapSec extends StatelessWidget {
  const CaptinMapSec({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeliveryMapCubit(LocationService(), RoutesUtils())
        ..updateMyLocation(),
      child: const Scaffold(
        body: CaptinMapBody(),
      ),
    );
  }
}
