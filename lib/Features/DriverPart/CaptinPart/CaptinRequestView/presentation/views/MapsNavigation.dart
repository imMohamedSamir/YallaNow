import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/openGoogleMaps.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/manager/captin_ride_request_cubit/captin_ride_request_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/manager/captin_map_cubit/captin_map_cubit.dart';

class MapsNavigation extends StatelessWidget {
  const MapsNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        var detailsModel =
            BlocProvider.of<CaptinRideRequestCubit>(context).detailsModel;
        var driverPos =
            BlocProvider.of<CaptinMapCubit>(context).currentposition;
        openGoogleMaps(
            srclat: driverPos!.latitude,
            srclng: driverPos.longitude,
            dstlat: detailsModel.currentLatitude,
            dstlng: detailsModel.currentLongitude);
      },
      child: Container(
        width: double.infinity,
        height: AppSizes.getHeight(50, context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: pKcolor),
        child: const Center(
          child: Icon(Icons.navigation_rounded, color: Colors.white, size: 38),
        ),
      ),
    );
  }
}
