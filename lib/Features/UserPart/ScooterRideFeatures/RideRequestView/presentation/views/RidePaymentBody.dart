import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/check_wallet_balance_cubit/check_wallet_balance_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/DriverPaymentMethodsTile.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/PromoCodeField.dart';
import 'package:yallanow/generated/l10n.dart';

class RidePaymentBody extends StatelessWidget {
  const RidePaymentBody({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CheckWalletBalanceCubit>(context).check(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).Paywith,
              style: AppStyles.styleSemiBold16(context)
                  .copyWith(color: const Color(0xff240301))),
          const SizedBox(height: 16),
          const DriverPaymentMethodsTile(),
          const Divider(height: 32, color: scColor),
          const PromoCodeField(),
          const Spacer(),
          CustomButton(
              text: S.of(context).Choose,
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
