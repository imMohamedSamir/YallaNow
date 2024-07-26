import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinOrdersView/presentation/views/LoadingCaptinTrips.dart';
import 'package:yallanow/Features/UserPart/RidesHistoryView/data/models/UserRideHistoryModel.dart';
import 'package:yallanow/Features/UserPart/RidesHistoryView/presentation/manager/cubit/user_ride_history_cubit.dart';
import 'package:yallanow/Features/UserPart/RidesHistoryView/presentation/views/UserRideCard.dart';
import 'package:yallanow/generated/l10n.dart';

class RidesHistoryViewBody extends StatelessWidget {
  const RidesHistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserRideHistoryCubit, UserRideHistoryState>(
      builder: (context, state) {
        if (state is UserRideHistorySuccess) {
          List<UserRideHistoryModel> rides = state.rides;
          if (rides.isEmpty) {
            return Center(
              child: Text(
                S.of(context).emptyRideMsg,
                textAlign: TextAlign.center,
                style: AppStyles.styleBold16(context).copyWith(color: pKcolor),
              ),
            );
          }
          return ListView.builder(
            itemCount: rides.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: UserRideCard(
                  rideHistory: rides[index],
                ),
              );
            },
          );
        } else if (state is UserRideHistoryLoading) {
          return const LoadingCaptinTrips();
        } else if (state is UserRideHistoryFailure) {
          return Center(
            child: Text(
              state.errMsg,
              style: AppStyles.styleBold16(context),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
