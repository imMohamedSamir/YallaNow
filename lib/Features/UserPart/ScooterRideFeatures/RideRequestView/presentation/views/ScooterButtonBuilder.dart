import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/check_payment_method_cubit/check_payment_method_cubit.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/scooter_request_cubit/scooter_request_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/FindingRideView.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/scooter_location_cubit/scooter_location_cubit.dart';

class ScooterButtonBuilder extends StatelessWidget {
  const ScooterButtonBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckPaymentMethodCubit, CheckPaymentMethodState>(
      builder: (context, state) {
        if (state is CheckPaymentMethodLoading) {
          return const Center(child: CircularProgressIndicator(color: pKcolor));
        } else if (state is CheckPaymentMethodChange) {
          return CustomButton(
              text: "Yalla",
              txtcolor: Colors.white,
              btncolor: pKcolor,
              onPressed: () async {
                if (state.methode == "cash") {
                  // findingRiderBS(context);
                  // BlocProvider.of<ScooterRequestCubit>(context).connect();

                  // BlocProvider.of<ScooterLocationCubit>(context)
                  //     .onRequestSend(context);
                } else if (state.methode == "Credit Card") {
                  log(state.methode);

                  BlocProvider.of<CheckPaymentMethodCubit>(context)
                      .goToPaymentPage(context, amount: 100);
                } else if (state.methode == "wallet") {
                  // findingRiderBS(context);
                }
              });
        } else {
          return CustomButton(
            text: "Yalla",
            txtcolor: Colors.white,
            btncolor: pKcolor,
            onPressed: () async {
              final cubit = BlocProvider.of<ScooterRequestCubit>(context);
              await cubit.sendRideRequest();
            },
          );
        }
      },
    );
  }
}
