import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/driver_details.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/manager/captin_details_cubit/captin_details_cubit.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/profileLoading.dart';
import 'package:yallanow/generated/l10n.dart';

class CaptinVehicleDetailsViewBody extends StatelessWidget {
  const CaptinVehicleDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocBuilder<CaptinDetailsCubit, CaptinDetailsState>(
        builder: (context, state) {
          if (state is CaptinDetailsSuccess) {
            CaptinDetailsModel captinDetailsModel = state.detailsModel;
            return Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        captinDetailsModel.vehicleImage![2],
                        height: AppSizes.getHeight(120, context),
                        width: AppSizes.getWidth(120, context),
                        fit: BoxFit.cover,
                      )),
                ),
                const Gap(24),
                CustomTextField(
                    initialValue: captinDetailsModel.scooterType,
                    label: S.of(context).vehicleModel,
                    readOnly: true),
                const Gap(16),
                CustomTextField(
                    initialValue: captinDetailsModel.scooterColor,
                    label: S.of(context).VehicleColor,
                    readOnly: true),
                const Gap(16),
                CustomTextField(
                    initialValue: captinDetailsModel.rideType,
                    label: S.of(context).VehicleType,
                    readOnly: true),
                const Gap(16),
              ],
            );
          } else if (state is CaptinDetailsLoading) {
            return const ProfileLoading();
          } else if (state is CaptinDetailsFailure) {
            return Center(
              child: Text(state.errMsg),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
