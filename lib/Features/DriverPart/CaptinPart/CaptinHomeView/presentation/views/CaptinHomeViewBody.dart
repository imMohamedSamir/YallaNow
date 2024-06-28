import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/manager/ride_request_cubit/CaptinRequestCubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/views/CaptinRequestBuilder.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/scooter_request_cubit/scooter_request_cubit.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/generated/l10n.dart';

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
        child: BlocBuilder<CaptinRequestCubit, CaptinRequestState>(
          builder: (context, state) {
            if (state is CaptinRequestJoinded) {
              return Column(
                children: [
                  const Gap(50),
                  Text(S.of(context).Searchingforrequests,
                      style: AppStyles.styleMedium24(context)),
                  const Gap(70),
                  LottieBuilder.asset("assets/Indicators/Loading.json"),
                ],
              );
            } else if (state is CaptinRequestInitial) {
              return Center(
                child: Text(S.of(context).readytosearchforrequests,
                    style: AppStyles.styleMedium24(context)),
              );
            } else if (state is CaptinRequestAccepted) {
              return const CaptinRequestBuilder();
            }
            if (state is CaptinRequestDisabled) {
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
                  Text(S.of(context).Enableyourlocation,
                      style: AppStyles.styleMedium24(context)),
                  const SizedBox(height: 12),
                  RichText(
                    text: TextSpan(
                        text: S.of(context).EnableLocationMsg,
                        style: AppStyles.styleMedium14(context)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 102),
                ],
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
