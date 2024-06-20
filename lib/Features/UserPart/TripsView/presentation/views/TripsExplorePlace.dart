import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/place_trips_cubit/place_trips_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripsExplorePlaceLv.dart';
import 'package:yallanow/generated/l10n.dart';

class TripsExplorePlace extends StatelessWidget {
  const TripsExplorePlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<PlaceTripsCubit, PlaceTripsState>(
          builder: (context, state) {
            bool isEmpty = false;
            if (state is PlaceTripsSuccess) {
              isEmpty = state.trips.isEmpty;
              if (!isEmpty) {
                return Text(S.of(context).Exploretrips,
                    style: AppStyles.styleMedium16(context));
              }
            }
            return const SizedBox();
          },
        ),
        const Gap(16),
        const TripsExplorePlaceLv()
      ],
    );
  }
}
