import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/manager/captin_map_cubit/captin_map_cubit.dart';

class CaptinMapBody extends StatelessWidget {
  const CaptinMapBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LatLng defaultLocation =
        const LatLng(27.215327138359253, 33.795513481012954);
    CameraPosition initialCameraPosition =
        CameraPosition(target: defaultLocation, zoom: 10);
    return BlocConsumer<CaptinMapCubit, CaptinMapState>(
      listener: (context, state) {
        if (state is CaptinMapSuccess) {
          initialCameraPosition =
              CameraPosition(target: state.locationData, zoom: 15);
          BlocProvider.of<CaptinMapCubit>(context).getRoutes(
              dist: const LatLng(37.282815371855804, -122.01923673720438));
        } else {
          initialCameraPosition =
              CameraPosition(target: defaultLocation, zoom: 10);
        }
      },
      builder: (context, state) {
        return GoogleMap(
          onMapCreated: (controller) {
            context.read<CaptinMapCubit>().setMapController(controller);
          },
          zoomControlsEnabled: false,
          initialCameraPosition: initialCameraPosition,
          markers: state is CaptinMapChange ? state.markers! : {},
          myLocationEnabled: true,
          indoorViewEnabled: true,
          polylines: state is CaptinMapChange ? state.polyLine! : {},
        );
      },
    );
  }
}
