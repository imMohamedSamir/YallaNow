import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/manager/ready_for_trips_cubit/ready_for_trips_cubit.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryHomeView/presentation/manager/delivery_request_cubit/delivery_request_cubit.dart';
import 'package:yallanow/generated/l10n.dart';

AppBar deliveryAppBar({required BuildContext context}) {
  return AppBar(
    centerTitle: true,
    title: const DeliveryYallButton(),
    // leading: Builder(builder: (context) {
    //   return IconButton(
    //       onPressed: () {
    //         Scaffold.of(context).openDrawer();
    //       },
    //       icon: const Icon(Icons.list));
    // }),
  );
}

class DeliveryYallButton extends StatelessWidget {
  const DeliveryYallButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryRequestCubit, DeliveryRequestState>(
      builder: (context, state) {
        bool isDisabled = state is DeliveryRequestDisabled;
        bool isJoined = state is DeliveryRequestConnected;

        return InkWell(
            borderRadius: BorderRadius.circular(32),
            onTap: isDisabled
                ? null
                : () async {
                    final cubit =
                        BlocProvider.of<DeliveryRequestCubit>(context);
                    final readyCubit =
                        BlocProvider.of<ReadyForTripsCubit>(context);
                    // final mapCubit = BlocProvider.of<CaptinMapCubit>(context);
                    await cubit.toggleJoin();
                    if (!isJoined) {
                      readyCubit.fetch();
                    } else {
                      readyCubit.stopListening();
                    }
                  },
            child: BlocBuilder<DeliveryRequestCubit, DeliveryRequestState>(
              builder: (context, state) {
                bool locationState = state is DeliveryRequestDisabled;
                bool isLoading = state is DeliveryRequestLoading;
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
