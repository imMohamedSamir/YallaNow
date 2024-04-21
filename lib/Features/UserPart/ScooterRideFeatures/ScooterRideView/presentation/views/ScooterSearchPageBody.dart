import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/auto_complete_places_cubit/auto_complete_places_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/views/RecentPlacesSec.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/views/ResultsPlacesSec.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/views/SearchFieldsSec.dart';

class ScooterSearchPageBody extends StatelessWidget {
  const ScooterSearchPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchFieldsSec(),
          const SizedBox(height: 16),
          const Divider(),
          SearchResultSec(
              textEditingController:
                  BlocProvider.of<AutoCompletePlacesCubit>(context)
                      .textEditingController),
        ],
      ),
    );
  }
}

class SearchResultSec extends StatelessWidget {
  const SearchResultSec({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    List<PlaceModel> places = [];
    return BlocBuilder<AutoCompletePlacesCubit, AutoCompletePlacesState>(
      builder: (context, state) {
        if (state is AutoCompletePlacesSucssess) {
          places = state.places;
          return ResultsPlacesSec(
            textEditingController: textEditingController,
            places: places,
          );
        } else {
          return const RecentPlacesSec();
        }
      },
    );
  }
}
