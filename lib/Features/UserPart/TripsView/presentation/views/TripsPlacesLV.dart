import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppLang.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_places_model.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/places_info_cubit/places_info_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripPlacesLoading.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripsPlacesCard.dart';

class TripsPlacesLV extends StatelessWidget {
  const TripsPlacesLV({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(120, context),
      child: BlocBuilder<PlacesInfoCubit, PlacesInfoState>(
        builder: (context, state) {
          if (state is PlacesInfoSuccess) {
            List<TripPlacesModel> places = state.places;
            return ListView.builder(
              itemCount: places.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final last = places.length - 1 == index;
                return Padding(
                  padding: EdgeInsets.only(
                    right: AppLang.isArabic() ? 16.0 : (last ? 0 : 16.0),
                    left: AppLang.isArabic() ? (last ? 0 : 16.0) : 0,
                  ),
                  child: TripsPlacesCard(
                    place: places[index],
                  ),
                );
              },
            );
          } else if (state is PlacesInfoLoading) {
            return const TripPlacesLoading();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
