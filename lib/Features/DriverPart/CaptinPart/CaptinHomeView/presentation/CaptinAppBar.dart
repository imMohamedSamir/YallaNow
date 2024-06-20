import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/scooter_request_cubit/scooter_request_cubit.dart';

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
    return BlocBuilder<ScooterRequestCubit, ScooterRequestState>(
      builder: (context, state) {
        bool isDisabled = state is ScooterRequestDisabled;

        return InkWell(
            borderRadius: BorderRadius.circular(32),
            onTap: isDisabled
                ? null
                : () async {
                    final cubit = BlocProvider.of<ScooterRequestCubit>(context);
                    await cubit.connect().then((_) async {
                      await cubit.toggleGroupMembership(driverGroup);
                    });
                  },
            child: BlocBuilder<ScooterRequestCubit, ScooterRequestState>(
              builder: (context, state) {
                bool currentState = state is ScooterRequestSuccess;
                bool locationState = state is ScooterRequestDisabled;
                bool isLoading = state is ScooterRequestLoading;
                if (state is ScooterRequestAccepted) {
                  return SizedBox();
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
                          : Text(currentState ? "Disable" : "Yalla",
                              style: AppStyles.styleSemiBold20(context)
                                  .copyWith(color: Colors.white)),
                    ));
              },
            ));
      },
    );
  }
}
