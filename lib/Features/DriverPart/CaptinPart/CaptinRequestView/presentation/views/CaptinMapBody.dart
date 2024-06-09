import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryRequestView/presentation/manager/delivery_map_cubit/delivery_map_cubit.dart';

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
    return BlocConsumer<DeliveryMapCubit, DeliveryMapState>(
      listener: (context, state) {
        if (state is DeliveryMapSuccess) {
          initialCameraPosition =
              CameraPosition(target: state.locationData, zoom: 15);
          BlocProvider.of<DeliveryMapCubit>(context).getRoutes(
              dist: const LatLng(37.282815371855804, -122.01923673720438));
        } else {
          initialCameraPosition =
              CameraPosition(target: defaultLocation, zoom: 10);
        }
      },
      builder: (context, state) {
        return GoogleMap(
          // onCameraIdle: () {
          //   bool ismoved =
          //       BlocProvider.of<CurrentLocationCubit>(context).isMoved;
          //   if (ismoved) {
          //     BlocProvider.of<CurrentLocationCubit>(context)
          //         .handleCameraMove(position: position1!);
          //   }
          // },
          // onCameraMove: (position) {
          //   position1 = position;
          // },
          onMapCreated: (controller) {
            context.read<DeliveryMapCubit>().setMapController(controller);
          },
          zoomControlsEnabled: false,
          initialCameraPosition: initialCameraPosition,
          markers: state is DeliveryMapChange ? state.markers! : {},
          myLocationEnabled: true,
          indoorViewEnabled: true,
          polylines: state is DeliveryMapChange ? state.polyLine! : {},
        );
      },
    );
  }
}
