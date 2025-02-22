import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/auto_complete_places_cubit/auto_complete_places_cubit.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/views/AddressLoadingPage.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/views/ResultsPlacesSec.dart';

class SearchResultSec extends StatelessWidget {
  const SearchResultSec({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<PlaceModel> places = [];
    return BlocBuilder<AutoCompletePlacesCubit, AutoCompletePlacesState>(
      builder: (context, state) {
        if (state is AutoCompletePlacesSucssess) {
          places = state.places;
          if (places.isEmpty) {
            return const SizedBox();
          }
          return ResultsPlacesSec(places: places);
        } else if (state is AutoCompletePlacesLoading) {
          return const AddressLoadingPage();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
