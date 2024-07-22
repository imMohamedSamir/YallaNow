import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/manager/captin_ride_request_cubit/captin_ride_request_cubit.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/views/SearchingIconWidget.dart';
import 'package:yallanow/generated/l10n.dart';

class CaptinHomeViewBody extends StatelessWidget {
  const CaptinHomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocBuilder<CaptinRideRequestCubit, CaptinRideRequestState>(
        builder: (context, state) {
          if (state is CaptinRideRequestConnected) {
            return Column(
              children: [
                const Gap(50),
                Text(S.of(context).Searchingforrequests,
                    style: AppStyles.styleMedium24(context)),
                const Gap(50),
                const SearchingIconWidget(),
              ],
            );
          } else if (state is CaptinRideRequestInitial ||
              state is CaptinRideRequestConnected) {
            return Column(
              children: [
                const Gap(100),
                Image.asset(
                  Assets.imagesOfflineDriver,
                  width: AppSizes.getWidth(250, context),
                  height: AppSizes.getHeight(250, context),
                  fit: BoxFit.contain,
                ),
                const Gap(50),
                // Text(S.of(context).readytosearchforrequests,
                //     style: AppStyles.styleMedium24(context)),

                Text(S.of(context).Youneedbeonline,
                    style: AppStyles.styleMedium24(context)),
                const SizedBox(height: 12),
                RichText(
                  text: TextSpan(
                      text: S.of(context).youNeesBeOnlineMsg,
                      style: AppStyles.styleMedium14(context)),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          } else if (state is CaptinRideRequestDisabled) {
            return Column(
              children: [
                const Spacer(),
                Image.asset(
                  Assets.imagesOfflineDriver,
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
            return const SizedBox();
          }
        },
      ),
    );
  }
}
