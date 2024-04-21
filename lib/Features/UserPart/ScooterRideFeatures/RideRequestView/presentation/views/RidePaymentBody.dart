import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/check_payment_method_cubit/check_payment_method_cubit.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/PaymentMethods.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/FindingRideView.dart';

class RidePaymentBody extends StatelessWidget {
  const RidePaymentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Pay with",
              style: AppStyles.styleSemiBold16(context)
                  .copyWith(color: const Color(0xff240301))),
          const SizedBox(height: 16),
          const PaymentMethodsTile(),
          const Spacer(),
          CustomButton(
              text: "Choose",
              txtcolor: Colors.white,
              btncolor: pKcolor,
              onPressed: () {
                Navigator.pop(context);
                // findingRiderBS(context);
              }),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
