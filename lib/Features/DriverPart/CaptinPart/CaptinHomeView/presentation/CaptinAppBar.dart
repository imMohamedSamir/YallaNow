import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/manager/captin_ride_request_cubit/captin_ride_request_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/manager/ready_for_trips_cubit/ready_for_trips_cubit.dart';
import 'package:yallanow/generated/l10n.dart';

AppBar captinAppBar({required BuildContext context}) {
  return AppBar(
    centerTitle: true,
    title: const CaptinYallButton(),
  );
}

class CaptinYallButton extends StatelessWidget {
  const CaptinYallButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CaptinRideRequestCubit, CaptinRideRequestState>(
      builder: (context, state) {
        bool isDisabled = state is CaptinRideRequestDisabled;
        bool isJoined = state is CaptinRideRequestConnected;

        return InkWell(
            borderRadius: BorderRadius.circular(32),
            onTap: isDisabled
                ? null
                : () async {
                    final cubit =
                        BlocProvider.of<CaptinRideRequestCubit>(context);
                    final readyCubit =
                        BlocProvider.of<ReadyForTripsCubit>(context);
                    // final mapCubit = BlocProvider.of<CaptinMapCubit>(context);
                    await cubit.toggleGroupMembership();
                    if (!isJoined) {
                      readyCubit.fetch();
                    } else {
                      readyCubit.stopListening();
                    }
                  },
            child: BlocBuilder<CaptinRideRequestCubit, CaptinRideRequestState>(
              builder: (context, state) {
                bool locationState = state is CaptinRideRequestDisabled;
                bool isLoading = state is CaptinRideRequestloading;
                // if (state is ScooterRequestAccepted) {
                //   return const SizedBox();
                // }
                return BlocBuilder<ReadyForTripsCubit, ReadyForTripsState>(
                  builder: (context, state) {
                    isLoading = state is ReadyForTripsLoading;
                    // isJoined = state is ReadyForTripsFailure ? false ;
                    return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 6),
                        decoration: BoxDecoration(
                            color: !locationState
                                ? pKcolor
                                : scColor.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(32)),
                        child: AnimatedSize(
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 250),
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white, strokeAlign: -3)
                              : Text(isJoined ? S.of(context).Disable : "Yalla",
                                  style: AppStyles.styleSemiBold20(context)
                                      .copyWith(color: Colors.white)),
                        ));
                  },
                );
              },
            ));
      },
    );
  }
}
