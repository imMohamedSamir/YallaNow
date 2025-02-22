import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/location_service.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/manager/captin_map_cubit/captin_map_cubit.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryRequestView/presentation/views/DeliveryMapBody.dart';
import 'package:yallanow/Core/utlis/RoutesUtlis.dart';

class DeliveryMapSec extends StatelessWidget {
  const DeliveryMapSec({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CaptinMapCubit(LocationService(), RoutesUtils())
        ..updateMyLocation(context),
      child: const Scaffold(
        body: DeliveryMapBody(),
      ),
    );
  }
}
