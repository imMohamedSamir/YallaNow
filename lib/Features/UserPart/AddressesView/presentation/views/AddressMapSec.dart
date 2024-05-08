import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/CurrentLocationCubit/current_location_cubit_cubit.dart';

class AddressMapSec extends StatelessWidget {
  const AddressMapSec({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CameraPosition? position1;

    return BlocBuilder<CurrentLocationCubit, CurrentLocationCubitState>(
      builder: (context, state) {
        // Define default location and initial camera position
        const LatLng defaultLocation =
            LatLng(27.215327138359253, 33.795513481012954);
        final CameraPosition initialCameraPosition =
            state is CurrentLocationCubitSucsess
                ? CameraPosition(target: state.locationData, zoom: 15)
                : const CameraPosition(target: defaultLocation, zoom: 10);
        // Return the GoogleMap wrapped with a BlocListener
        return GoogleMap(
          onCameraIdle: () {
            bool ismoved =
                BlocProvider.of<CurrentLocationCubit>(context).isMoved;
            if (ismoved) {
              BlocProvider.of<CurrentLocationCubit>(context)
                  .handleCameraMove(position: position1!);
            }
          },
          onCameraMove: (position) {
            position1 = position;
          },
          onMapCreated: (controller) {
            context.read<CurrentLocationCubit>().setMapController(controller);
          },
          zoomControlsEnabled: false,
          initialCameraPosition: initialCameraPosition,
          markers: context.read<CurrentLocationCubit>().markers,
        );
      },
    );
  }
}
