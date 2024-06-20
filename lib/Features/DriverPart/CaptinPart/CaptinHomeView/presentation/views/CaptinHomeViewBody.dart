import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/views/CaptinRequestBuilder.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/scooter_request_cubit/scooter_request_cubit.dart';
import 'package:gap/gap.dart';

class CaptinHomeViewBody extends StatelessWidget {
  const CaptinHomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: BlocBuilder<ScooterRequestCubit, ScooterRequestState>(
          builder: (context, state) {
            if (state is ScooterRequestSuccess) {
              return Column(
                children: [
                  const Gap(50),
                  Text("Searching for requests",
                      style: AppStyles.styleMedium24(context)),
                  const Gap(70),
                  const LinearProgressIndicator(color: pKcolor),
                ],
              );
            } else if (state is ScooterRequestInitial) {
              return Center(
                child: Text("Are you ready to search for requests",
                    style: AppStyles.styleMedium24(context)),
              );
            } else if (state is ScooterRequestAccepted) {
              return CaptinRequestBuilder();
              // return Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     const Gap(30),
              //     Row(
              //       children: [
              //         Text("request details",
              //             style: AppStyles.styleMedium24(context)),
              //         const Spacer(),
              //         IconButton(
              //             onPressed: () {
              //               BlocProvider.of<ScooterRequestCubit>(context)
              //                   .cancelRequest();
              //             },
              //             icon: const Icon(Icons.close))
              //       ],
              //     ),
              //     const Gap(12),
              //     Text(request["location"] ?? "error"),
              //     const Gap(12),

              //     Text(request["destination"] ?? "error"),
              //     const Gap(12),

              //     Text(request["price"] ?? "error"),
              //     const Gap(12),

              //     Text(request["userName"] ?? "error"),
              //     const Gap(12),

              //     Text(request["paymentMethod"] ?? "error"),
              //     // const LinearProgressIndicator(color: pKcolor),
              //   ],
              // );
            }
            return Column(
              children: [
                const Spacer(),
                Image.asset(
                  Assets.imagesOB1,
                  width: AppSizes.getWidth(350, context),
                  height: AppSizes.getHeight(350, context),
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 12),
                Text("Enable your location",
                    style: AppStyles.styleMedium24(context)),
                const SizedBox(height: 12),
                RichText(
                  text: TextSpan(
                      text:
                          "enable your location to get requests in your current area",
                      style: AppStyles.styleMedium14(context)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 102),
              ],
            );
          },
        ),
      ),
    );
  }
}
