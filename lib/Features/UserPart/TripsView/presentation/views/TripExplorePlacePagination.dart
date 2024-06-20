import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/place_trips_cubit/place_trips_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripExplorePagination.dart';

class TripExplorePlacePagination extends StatelessWidget {
  const TripExplorePlacePagination({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaceTripsCubit, PlaceTripsState>(
      builder: (context, state) {
        bool hasMore = false;
        bool isFirst = true;
        var cubit = BlocProvider.of<PlaceTripsCubit>(context);
        if (state is PlaceTripsSuccess) {
          hasMore = state.hasMore;
          isFirst = state.currentPage == 0;
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isFirst)
              PaginationIndicator(
                icon: Icons.arrow_back_ios_new_rounded,
                onPressed: () {
                  cubit.back();
                },
              ),
            const Gap(16),
            if (hasMore)
              PaginationIndicator(
                icon: Icons.arrow_forward_ios_rounded,
                onPressed: () {
                  cubit.next();
                },
              )
          ],
        );
      },
    );
  }
}
