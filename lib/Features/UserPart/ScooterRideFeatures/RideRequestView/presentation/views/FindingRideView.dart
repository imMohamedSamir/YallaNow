import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/DialogMethode.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/scooter_request_cubit/scooter_request_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/CallDetailsSec.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/DriverDetailsSec.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/RiderSrcDstSec.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/RiderTotalAmount.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/ScooterDetailsSec.dart';
import 'package:yallanow/generated/l10n.dart';

class FindingRideView extends StatelessWidget {
  const FindingRideView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScooterRequestCubit, ScooterRequestState>(
      builder: (context, state) {
        if (state is ScooterRequestSent) {
          var request = state.requestData;

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).Findingyourider,
                  style: AppStyles.styleSemiBold20(context)),
              const SizedBox(height: 16),
              const LinearProgressIndicator(color: pKcolor),
              const SizedBox(height: 16),
              Center(
                child: Image.asset(
                  getImg(type: request.vehicleType!),
                  height: AppSizes.getHeight(100, context),
                  width: AppSizes.getWidth(100, context),
                ),
              ),
              const Divider(height: 18),
              RiderSrcDstSec(src: request.location, dst: request.destination),
              const Divider(height: 18),
              RideTotalAmount(price: request.price.toString()),
              const Divider(height: 32),
              const Gap(40),
              CustomButton(
                text: S.of(context).Cancel,
                txtcolor: pKcolor,
                btncolor: Colors.white,
                isBasket: true,
                onPressed: () {
                  cancelRidedialogMethode(context);
                },
              )
            ],
          );
        } else if (state is ScooterRequestDriverAccepted) {
          return Container(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Meet your Driver after",
                          style: AppStyles.styleSemiBold20(context)),
                      const Spacer(),
                      Text("6 min", style: AppStyles.styleBold16(context))
                    ],
                  ),
                  const Divider(
                      thickness: 2, height: 24, color: Color(0xff9E9D9D)),
                  const DriverDetailsSec(),
                  const Divider(color: Color(0xff9E9D9D), height: 24),
                  const ScooterDetailsSec(),
                  const Divider(color: Color(0xff9E9D9D), height: 24),
                  const RiderSrcDstSec(),
                  const Divider(color: Color(0xff9E9D9D), height: 24),
                  const RideTotalAmount(),
                  const Divider(color: Color(0xff9E9D9D), height: 24),
                  const CallDetailsSec(),
                  const SizedBox(height: 12)
                ],
              ),
            ),
          );
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Finding you a rider",
                style: AppStyles.styleSemiBold20(context)),
            const SizedBox(height: 16),
            const LinearProgressIndicator(color: pKcolor),
            const SizedBox(height: 16),
            Center(
              child: Image.asset(
                Assets.imagesAvailScooter,
                height: AppSizes.getHeight(100, context),
                width: AppSizes.getWidth(100, context),
              ),
            ),
            const Divider(height: 18),
            const RiderSrcDstSec(),
            const Divider(height: 18),
            const RideTotalAmount(),
            const Divider(height: 18),
            CustomButton(
              text: S.of(context).Cancel,
              txtcolor: pKcolor,
              btncolor: Colors.white,
              isBasket: true,
              onPressed: () {
                cancelRidedialogMethode(context);
              },
            )
          ],
        );
      },
    );
  }

  String getImg({required String type}) {
    if (type == "Scooter Vehicle 1") {
      return Assets.imagesScooterVehicle1;
    } else {
      return Assets.imagesScooterVehicle2;
    }
  }
}

// 