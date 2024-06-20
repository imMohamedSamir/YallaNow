import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/AvailableRideLV.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/AvailableRidePayMethod.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/ScooterButtonBuilder.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/scooter_location_cubit/scooter_location_cubit.dart';
import 'package:yallanow/generated/l10n.dart';

class AvailableRideBS extends StatelessWidget {
  const AvailableRideBS({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).Choosearide,
            style: AppStyles.styleSemiBold20(context)
                .copyWith(color: const Color(0xff2A2A2A))),
        const SizedBox(height: 16.0),
        const AvailableRideLV(),
        const SizedBox(height: 16),
        const AvailableRidePayMethod(),
        const SizedBox(height: 16),
        const ScooterButtonBuilder()
      ],
    );
  }
}

class ChooseRideType extends StatelessWidget {
  const ChooseRideType({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScooterLocationCubit, ScooterLocationState>(
      builder: (context, state) {
        if (state is ScooterLocationFailuer) {
          return DraggableScrollableSheet(
            initialChildSize: 0.30,
            minChildSize: 0.13,
            maxChildSize: .70,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16))),
                  child: Column(
                    children: [
                      Image.asset(
                        Assets.imagesComingSoon,
                        height: 100,
                        width: 100,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        state.errmsg,
                        style: AppStyles.styleBold16(context),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ));
            },
          );
        }

        return DraggableScrollableSheet(
          initialChildSize: 0.30,
          minChildSize: 0.13,
          maxChildSize: .62,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: <Widget>[
                    Container(
                        height: 40,
                        alignment: Alignment.center,
                        child: const Icon(Icons.drag_handle)),
                    const AvailableRideBS()
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
