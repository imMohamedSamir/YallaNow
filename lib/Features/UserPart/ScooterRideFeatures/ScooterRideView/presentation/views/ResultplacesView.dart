import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/auto_complete_places_cubit/auto_complete_places_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/scooter_location_cubit/scooter_location_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/views/ResultsPlacesCard.dart';

class ResultplacesView extends StatelessWidget {
  const ResultplacesView({super.key, required this.places});
  final List<PlaceModel> places;
  // final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ScooterLocationCubit, ScooterLocationState>(
        listener: (context, state) {
          if (state is ScooterLocationChange) {
            Navigator.of(context).pop();
          } else if (state is ScooterLocationFailuer) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text("please try again and choose correct place")),
            );
          }
        },
        child: Column(
          children: List.generate(
              places.length,
              (index) => Padding(
                  padding: EdgeInsets.only(
                      bottom: index == places.length - 1 ? 0 : 14.0),
                  child: ResultsPlacesCard(
                    onTap: () async {
                      var locationCubit =
                          BlocProvider.of<ScooterLocationCubit>(context);
                      var autoCompleteCubit =
                          BlocProvider.of<AutoCompletePlacesCubit>(context);
                      autoCompleteCubit.sessionToken = null;
                      var srcNod = autoCompleteCubit.sourceFocusNode;
                      var dstNod = autoCompleteCubit.destinationFocusNode;
                      if (srcNod.hasFocus) {
                        autoCompleteCubit.sourceTextController.text =
                            places[index].description!;
                        dstNod.requestFocus();
                        autoCompleteCubit.clearPlaces();
                        locationCubit.selectedCurrentLocation(
                            description: places[index].description!);
                      }
                      if (dstNod.hasFocus) {
                        autoCompleteCubit.distanceTextController.text =
                            places[index].description!;
                        await locationCubit.selectedLocation(context,
                            description:
                                autoCompleteCubit.distanceTextController.text);
                      }
                      if (!context.mounted) return;
                      autoCompleteCubit.distanceTextController.text =
                          places[index].description!;
                      await locationCubit.selectedLocation(context,
                          description:
                              autoCompleteCubit.distanceTextController.text);
                    },
                    address: places[index].description!,
                  ))),
        ));
  }
}
