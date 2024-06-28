import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/check_payment_method_cubit/check_payment_method_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/scooter_request_cubit/scooter_request_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/RidePaymentView.dart';

class AvailableRidePayMethod extends StatelessWidget {
  const AvailableRidePayMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigateToPage.slideFromRight(
            context: context, page: const RidePaymentView());
      },
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.imagesCashICon,
            width: AppSizes.getWidth(28, context),
            height: AppSizes.getHeight(28, context),
          ),
          const SizedBox(width: 20),
          BlocBuilder<CheckPaymentMethodCubit, CheckPaymentMethodState>(
            builder: (context, state) {
              var userRequestModel =
                  BlocProvider.of<ScooterRequestCubit>(context).userRequest;
              if (state is CheckPaymentMethodChange) {
                userRequestModel.paymentMethod = state.methode;

                return Text(state.methode,
                    style: AppStyles.styleSemiBold16(context));
              }
              if (state is CheckPaymentMethodLoading) {
                userRequestModel.paymentMethod = state.methode;

                return Text(state.methode ?? "Cash",
                    style: AppStyles.styleSemiBold16(context));
              } else {
                userRequestModel.paymentMethod = "Cash";

                return Text("Cash", style: AppStyles.styleSemiBold16(context));
              }
            },
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios_rounded)
        ],
      ),
    );
  }
}
