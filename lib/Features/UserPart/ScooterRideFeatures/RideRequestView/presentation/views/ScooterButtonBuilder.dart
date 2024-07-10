import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/check_payment_method_cubit/check_payment_method_cubit.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/scooter_request_cubit/UserRidRequestCubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/send_request_cubit/send_request_cubit.dart';

class ScooterButtonBuilder extends StatelessWidget {
  const ScooterButtonBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckPaymentMethodCubit, CheckPaymentMethodState>(
      builder: (context, paymentState) {
        return BlocBuilder<SendRequestCubit, SendRequestState>(
          builder: (context, requestState) {
            if (paymentState is CheckPaymentMethodLoading ||
                requestState is SendRequestLoading) {
              return const Center(
                  child: CircularProgressIndicator(color: pKcolor));
            } else if (paymentState is CheckPaymentMethodChange) {
              return CustomButton(
                text: "Yalla",
                txtcolor: Colors.white,
                btncolor: pKcolor,
                onPressed: () async {
                  if (paymentState.methode == PaymentMethod.cash) {
                    BlocProvider.of<SendRequestCubit>(context).send();
                  } else if (paymentState.methode == PaymentMethod.creditCard) {
                    log(paymentState.methode.name);
                    var price = double.parse(
                        BlocProvider.of<SendRequestCubit>(context)
                            .requestModel
                            .price!);
                    BlocProvider.of<CheckPaymentMethodCubit>(context)
                        .goToPaymentPage(context, amount: price);
                  } else if (paymentState.methode == PaymentMethod.wallet) {
                    // Handle wallet payment method
                  }
                },
              );
            } else {
              return CustomButton(
                text: "Yalla",
                txtcolor: Colors.white,
                btncolor: pKcolor,
                onPressed: () async {
                  var cubit = BlocProvider.of<UserRidRequestCubit>(context);
                  BlocProvider.of<SendRequestCubit>(context).send();
                  // await cubit.initialize();
                  cubit.connect();
                },
              );
            }
          },
        );
      },
    );
  }
}
