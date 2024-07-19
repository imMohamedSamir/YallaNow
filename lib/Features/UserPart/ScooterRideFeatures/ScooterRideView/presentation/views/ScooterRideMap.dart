import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/scooter_request_cubit/UserRidRequestCubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/scooter_location_cubit/scooter_location_cubit.dart';

class ScooterRideMap extends StatelessWidget {
  const ScooterRideMap({super.key});

  @override
  Widget build(BuildContext context) {
    // CameraPosition? position1;
    LatLng defaultLocation =
        const LatLng(27.215327138359253, 33.795513481012954);
    CameraPosition initialCameraPosition =
        CameraPosition(target: defaultLocation, zoom: 10);
    return BlocListener<UserRidRequestCubit, UserRideRequestState>(
      listener: (context, state) {
        if (state is UserRideRequestAccepted) {
          BlocProvider.of<ScooterLocationCubit>(context)
              .listenToDriverLocationUpdates(
                  driverId: state.driverInfoModel.driverId);
        }
      },
      child: BlocConsumer<ScooterLocationCubit, ScooterLocationState>(
        listener: (context, state) {
          if (state is ScooterLocationSuccess) {
            initialCameraPosition =
                CameraPosition(target: state.locationData, zoom: 15);
          } else {
            initialCameraPosition =
                CameraPosition(target: defaultLocation, zoom: 10);
          }
        },
        builder: (context, state) {
          return GoogleMap(
            onMapCreated: (controller) {
              BlocProvider.of<ScooterLocationCubit>(context)
                  .setMapController(controller);
              BlocProvider.of<ScooterLocationCubit>(context).updateMyLocation();
            },
            zoomControlsEnabled: false,
            initialCameraPosition: initialCameraPosition,
            // cameraTargetBounds:
            //     BlocProvider.of<ScooterLocationCubit>(context).appCamerabounds,
            polylines:
                state is ScooterLocationChange ? state.polyLines ?? {} : {},
            markers: state is ScooterLocationChange ? state.markers ?? {} : {},
            myLocationEnabled: true,
            compassEnabled: false,
            myLocationButtonEnabled: false,
            mapType: MapType.normal,
          );
        },
      ),
    );
  }
}
