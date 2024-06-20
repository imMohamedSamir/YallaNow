import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/trips_by_type_cubit/trips_by_type_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripExplorePagination.dart';

class TripExploreTypePagination extends StatelessWidget {
  const TripExploreTypePagination({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripsByTypeCubit, TripsByTypeState>(
      builder: (context, state) {
        bool hasMore = false;
        bool isFirst = true;
        var cubit = BlocProvider.of<TripsByTypeCubit>(context);
        if (state is TripsByTypeSuccess) {
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
