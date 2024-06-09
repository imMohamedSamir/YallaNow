import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/scooter_location_cubit/scooter_location_cubit.dart';

class ScooterRideMap extends StatelessWidget {
  const ScooterRideMap({super.key});

  @override
  Widget build(BuildContext context) {
    CameraPosition? position1;
    // Trigger an update to fetch the current location
    return BlocBuilder<ScooterLocationCubit, ScooterLocationState>(
      builder: (context, state) {
        // Define default location and initial camera position
        const LatLng defaultLocation =
            LatLng(27.215327138359253, 33.795513481012954);
        final CameraPosition initialCameraPosition =
            state is ScooterLocationSuccess
                ? CameraPosition(target: state.locationData, zoom: 15)
                : const CameraPosition(target: defaultLocation, zoom: 10);
        // Return the GoogleMap wrapped with a BlocListener
        return GoogleMap(
          // onCameraIdle: () {
          //   if (position1 != null) {
          //     BlocProvider.of<ScooterLocationCubit>(context)
          //         .handleCameraMove(position: position1!);
          //   }
          // },
          // onCameraMove: (position) {
          //   position1 = position;
          // },
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
    );
  }
}
