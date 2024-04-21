import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/scooter_location_cubit/scooter_location_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/views/ResultsPlacesCard.dart';

class ResultplacesView extends StatelessWidget {
  const ResultplacesView(
      {super.key, required this.places, required this.textEditingController});
  final List<PlaceModel> places;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          places.length,
          (index) => Padding(
              padding: EdgeInsets.only(
                  bottom: index == places.length - 1 ? 0 : 14.0),
              child: ResultsPlacesCard(
                onTap: () async {
                  textEditingController.text = places[index].description!;
                  // await BlocProvider.of<ScooterLocationCubit>(context)
                  //     .SelectedLocation(
                  //         description: places[index].description!);

                  if (!context.mounted) return;
                  Navigator.of(context).pop();
                },
                address: places[index].description!,
              ))),
    );
  }
}
