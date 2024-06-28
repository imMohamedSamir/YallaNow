import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/manager/ride_request_cubit/CaptinRequestCubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/manager/captin_map_cubit/captin_map_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/scooter_request_cubit/scooter_request_cubit.dart';
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
    return BlocBuilder<CaptinRequestCubit, CaptinRequestState>(
      builder: (context, state) {
        bool isDisabled = state is CaptinRequestDisabled;
        return InkWell(
            borderRadius: BorderRadius.circular(32),
            onTap: isDisabled
                ? null
                : () async {
                    final cubit = BlocProvider.of<CaptinRequestCubit>(context);
                    final mapCubit = BlocProvider.of<CaptinMapCubit>(context);
                    await cubit.connect().then((_) async {
                      await cubit.toggleGroupMembership(driverGroup);
                      if (!context.mounted) return;
                      mapCubit.updateMyTrackingLocation(context);
                    });
                  },
            child: BlocBuilder<CaptinRequestCubit, CaptinRequestState>(
              builder: (context, state) {
                bool isJoined = state is CaptinRequestJoinded;
                bool locationState = state is CaptinRequestDisabled;
                bool isLoading = state is CaptinRequestLoading;
                if (state is ScooterRequestAccepted) {
                  return const SizedBox();
                }
                return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 35, vertical: 6),
                    decoration: BoxDecoration(
                        color:
                            !locationState ? pKcolor : scColor.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(32)),
                    child: AnimatedSize(
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 250),
                      child: isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white, strokeAlign: -3)
                          : Text(
                              isJoined
                                  ? S.of(context).Disable
                                  : S.of(context).Yalla,
                              style: AppStyles.styleSemiBold20(context)
                                  .copyWith(color: Colors.white)),
                    ));
              },
            ));
      },
    );
  }
}
