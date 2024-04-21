import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/check_payment_method_cubit/check_payment_method_cubit.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/PaymentWebView.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/FindingRideView.dart';

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
        } else if (state is CheckPaymentMethodCreditMethod) {
          return CustomButton(
              text: "Yalla",
              txtcolor: Colors.white,
              btncolor: const Color(0xffB20404),
              onPressed: () async {
                String paymentKey =
                    await BlocProvider.of<CheckPaymentMethodCubit>(context)
                        .goToPaymentPage(amount: 100);

                if (!context.mounted) return;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PaymentWebView(paymentKey: paymentKey),
                  ),
                );
              });
        } else {
          return CustomButton(
            text: "Yalla",
            txtcolor: Colors.white,
            btncolor: const Color(0xffB20404),
            onPressed: () {
              findingRiderBS(context);
              // showOrderPlaced(context);
            },
          );
        }
      },
    );
  }
}
