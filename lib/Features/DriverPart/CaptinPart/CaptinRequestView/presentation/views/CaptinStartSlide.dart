import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/utlis/functions/openGoogleMaps.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/manager/captin_ride_request_cubit/captin_ride_request_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/manager/captin_map_cubit/captin_map_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/manager/captin_start_trip_cubit/captin_start_trip_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/views/CaptinCheckoutPage.dart';

class CaptinSlideAction extends StatelessWidget {
  const CaptinSlideAction({
    super.key,
    this.isStarted = false,
    required this.tripId,
  });
  final bool isStarted;
  final String tripId;
  @override
  Widget build(BuildContext context) {
    var mapCubit = BlocProvider.of<CaptinMapCubit>(context);
    var requestCubit = BlocProvider.of<CaptinRideRequestCubit>(context);
    var startCubit = BlocProvider.of<CaptinStartTripCubit>(context);
    return Container(
      width: double.infinity,
      height: AppSizes.getHeight(60, context),
      // padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: pKcolor, borderRadius: BorderRadius.circular(16)),
      child: BlocListener<CaptinStartTripCubit, CaptinStartTripState>(
        listener: (context, state) {
          if (state is CaptinStartTripStarted) {
            openGoogleMaps(
                src: mapCubit.currentposition!,
                dst: LatLng(requestCubit.detailsModel.dstLatitude,
                    requestCubit.detailsModel.dstLongitude));
          } else if (state is CaptinStartTripEnded) {
            mapCubit.cancelListening();
            requestCubit.setInitial();
            NavigateToPage.slideFromRight(
                context: context, page: const CaptinCheckoutPage());
          }
        },
        child: Dismissible(
            direction: DismissDirection.startToEnd,
            key: UniqueKey(),
            background: Container(
              width: double.infinity,
              alignment: Alignment.centerRight,
              height: AppSizes.getHeight(60, context),
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(16)),
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                isStarted ? "انهاء" : "ابدا",
                style: AppStyles.styleMedium18(context)
                    .copyWith(color: Colors.white),
              ),
            ),
            onDismissed: (direction) {
              if (isStarted) {
                mapCubit.isStarted = false;
                startCubit.end(tripId: tripId);
              } else {
                mapCubit.isStarted = true;
                startCubit.start(tripId: tripId);
              }
            },
            child: const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.arrow_circle_left,
                      size: 46, color: Colors.white),
                ))),
      ),
    );
  }
}
