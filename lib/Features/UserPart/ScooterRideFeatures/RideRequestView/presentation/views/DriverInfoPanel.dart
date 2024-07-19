import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/DialogMethode.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/models/AcceptRideModel.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/scooter_request_cubit/UserRidRequestCubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/CallDetailsSec.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/DriverDetailsSec.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/RiderSrcDstSec.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/ScooterDetailsSec.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/scooter_location_cubit/scooter_location_cubit.dart';
import 'package:yallanow/generated/l10n.dart';

class DriverInfoPanel extends StatelessWidget {
  const DriverInfoPanel({
    super.key,
    required this.driverInfoModel,
  });
  final AcceptRideModel driverInfoModel;
  @override
  Widget build(BuildContext context) {
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
                BlocBuilder<ScooterLocationCubit, ScooterLocationState>(
                  builder: (context, state) {
                    String? duration =
                        state is ScooterLocationChange ? state.duration : "";
                    return Text("$duration min",
                        style: AppStyles.styleBold16(context));
                  },
                )
              ],
            ),
            const Divider(thickness: 2, height: 24, color: Color(0xff9E9D9D)),
            DriverDetailsSec(
              name: "${driverInfoModel.firstName} ${driverInfoModel.lastName}",
              rating: driverInfoModel.rating,
              imag: driverInfoModel.image,
            ),
            const Divider(color: Color(0xff9E9D9D), height: 24),
            ScooterDetailsSec(
              type: driverInfoModel.vehicleType,
              color: driverInfoModel.vehicleColor,
              plate: driverInfoModel.licensePlate,
            ),
            const Divider(color: Color(0xff9E9D9D), height: 24),
            RiderSrcDstSec(
                src: driverInfoModel.location,
                dst: driverInfoModel.destination),
            // const Divider(color: Color(0xff9E9D9D), height: 24),
            // RideTotalAmount(price: "345"),
            const Divider(color: Color(0xff9E9D9D), height: 24),
            CallDetailsSec(phoneNumber: driverInfoModel.phoneNumber),
            const SizedBox(height: 16),
            BlocBuilder<UserRidRequestCubit, UserRideRequestState>(
              builder: (context, state) {
                bool istarted = false;
                if (state is UserRideRequestAccepted) {
                  istarted = state.isStarted;
                }
                return Visibility(
                  visible: !istarted,
                  child: CustomButton(
                    text: S.of(context).Cancel,
                    txtcolor: pKcolor,
                    btncolor: Colors.white,
                    isBasket: true,
                    onPressed: () {
                      cancelUserRidedialogMethode(context);
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
