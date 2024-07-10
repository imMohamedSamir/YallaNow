import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/DialogMethode.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/models/user_request_model.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/RiderSrcDstSec.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/RiderTotalAmount.dart';
import 'package:yallanow/generated/l10n.dart';

class FindingRideView extends StatelessWidget {
  const FindingRideView({
    super.key,
    required this.requestModel,
  });
  final UserRequestModel requestModel;
  @override
  Widget build(BuildContext context) {
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
            getImg(type: requestModel.vehicleType!),
            height: AppSizes.getHeight(100, context),
            width: AppSizes.getWidth(100, context),
          ),
        ),
        const Divider(height: 18),
        RiderSrcDstSec(
            src: requestModel.location, dst: requestModel.destination),
        const Divider(height: 18),
        RideTotalAmount(price: requestModel.price.toString()),
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
