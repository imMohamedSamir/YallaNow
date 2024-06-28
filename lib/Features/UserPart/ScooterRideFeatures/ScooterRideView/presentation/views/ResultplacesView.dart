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
    return BlocConsumer<ScooterLocationCubit, ScooterLocationState>(
      listener: (context, state) {
        if (state is ScooterLocationChange) {
          Navigator.of(context).pop();
        } else if (state is ScooterLocationFailuer) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errmsg)),
          );
        }
      },
      builder: (context, state) {
        if (state is ScooterLocationLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Column(
            children: List.generate(
                places.length,
                (index) => Padding(
                    padding: EdgeInsets.only(
                        bottom: index == places.length - 1 ? 0 : 14.0),
                    child: ResultsPlacesCard(
                      onTap: () async {
                        var srcNod =
                            BlocProvider.of<AutoCompletePlacesCubit>(context)
                                .sourceFocusNode;
                        var dstNod =
                            BlocProvider.of<AutoCompletePlacesCubit>(context)
                                .destinationFocusNode;
                        if (srcNod.hasFocus) {
                          BlocProvider.of<AutoCompletePlacesCubit>(context)
                              .sourceTextController
                              .text = places[index].description!;
                          dstNod.requestFocus();
                          BlocProvider.of<AutoCompletePlacesCubit>(context)
                              .clearPlaces();
                          BlocProvider.of<ScooterLocationCubit>(context)
                              .selectedCurrentLocation(
                                  description: places[index].description!);
                        }
                        if (dstNod.hasFocus) {
                          BlocProvider.of<AutoCompletePlacesCubit>(context)
                              .distanceTextController
                              .text = places[index].description!;
                          await BlocProvider.of<ScooterLocationCubit>(context)
                              .selectedLocation(context,
                                  description:
                                      BlocProvider.of<AutoCompletePlacesCubit>(
                                              context)
                                          .distanceTextController
                                          .text);
                        }
                        await BlocProvider.of<ScooterLocationCubit>(context)
                            .selectedLocation(context,
                                description:
                                    BlocProvider.of<AutoCompletePlacesCubit>(
                                            context)
                                        .distanceTextController
                                        .text);
                      },
                      address: places[index].description!,
                    ))),
          );
        }
      },
    );
  }
}
