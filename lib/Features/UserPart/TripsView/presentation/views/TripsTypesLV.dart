import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/trip_types_cubit/trip_types_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripPlacesLoading.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripsTypesCard.dart';

class TripsTypesLV extends StatelessWidget {
  const TripsTypesLV({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(92, context),
      child: BlocBuilder<TripTypesCubit, TripTypesState>(
        builder: (context, state) {
          if (state is TripTypesSuccess) {
            List<dynamic> types = state.types;
            return ListView.builder(
              itemCount: types.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (types[index] == null) {
                  return const SizedBox.shrink();
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: TripsTypesCard(name: types[index].toString()),
                  );
                }
              },
            );
          }
          if (state is TripTypesLoading) {
            return const TripPlacesLoading();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
