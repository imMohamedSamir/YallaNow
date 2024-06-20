import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/explore_trips_cubit.dart/explore_trips_cubit.dart';

class TripExplorePagination extends StatelessWidget {
  const TripExplorePagination({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreTripsCubit, ExploreTripsState>(
      builder: (context, state) {
        bool hasMore = false;
        bool isFirst = true;
        if (state is ExploreTripsSuccess) {
          hasMore = state.hasMore;
          isFirst = state.isFirstPage;
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isFirst)
              PaginationIndicator(
                icon: Icons.arrow_back_ios_new_rounded,
                onPressed: () {
                  BlocProvider.of<ExploreTripsCubit>(context).back();
                },
              ),
            const Gap(16),
            if (hasMore)
              PaginationIndicator(
                icon: Icons.arrow_forward_ios_rounded,
                onPressed: () {
                  BlocProvider.of<ExploreTripsCubit>(context).next();
                },
              )
          ],
        );
      },
    );
  }
}

class PaginationIndicator extends StatelessWidget {
  const PaginationIndicator({super.key, this.icon, this.onPressed});
  final IconData? icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppSizes.getHeight(35, context),
        width: AppSizes.getWidth(35, context),
        decoration: const BoxDecoration(shape: BoxShape.circle, color: pKcolor),
        child: Center(
          child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: onPressed,
              icon: Icon(icon, color: Colors.white, size: 20)),
        ));
  }
}
