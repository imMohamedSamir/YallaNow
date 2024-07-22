import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/data/models/vehicel_detaisl_model.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/presentation/manager/vehicle_details_cubit/vehicle_details_cubit.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/profileLoading.dart';
import 'package:yallanow/generated/l10n.dart';

class CaptinVehicleDetailsViewBody extends StatelessWidget {
  const CaptinVehicleDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocBuilder<VehicleDetailsCubit, VehicleDetailsState>(
        builder: (context, state) {
          if (state is VehicleDetailsSuccess) {
            VehicleDetaislModel vehicelDetails = state.detaislModel;
            return SingleChildScrollView(
              child: Column(
                children: [
                  _buildImages(context, vehicelDetails.vehicleImage!),
                  const Gap(24),
                  CustomTextField(
                      initialValue: vehicelDetails.vehiclemodel,
                      label: S.of(context).vehicleModel,
                      readOnly: true),
                  const Gap(16),
                  CustomTextField(
                      initialValue: vehicelDetails.vehiclecolor,
                      label: S.of(context).VehicleColor,
                      readOnly: true),
                  const Gap(16),
                  CustomTextField(
                      initialValue: vehicelDetails.vehicleType.toString(),
                      label: S.of(context).VehicleType,
                      readOnly: true),
                  const Gap(16),
                  CustomTextField(
                      initialValue: vehicelDetails.vehicleYear.toString(),
                      label: S.of(context).vehicleYear,
                      readOnly: true),
                  const Gap(16),
                  CustomTextField(
                      initialValue: vehicelDetails.plateNumbers.toString(),
                      label: S.of(context).licensePlate,
                      readOnly: true),
                  const Gap(16),
                ],
              ),
            );
          } else if (state is VehicleDetailsLoading) {
            return const ProfileLoading();
          } else if (state is VehicleDetailsFailure) {
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

  Widget _buildImages(BuildContext context, List images) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).VehicleImages,
            style: AppStyles.styleMedium16(context)),
        const Gap(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(
                images[0],
                height: AppSizes.getHeight(120, context),
                width: AppSizes.getWidth(120, context),
                fit: BoxFit.contain,
              ),
            ),
            const Gap(16),
            Expanded(
              child: Image.network(
                images[1],
                height: AppSizes.getHeight(120, context),
                width: AppSizes.getWidth(120, context),
                fit: BoxFit.contain,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(
                images[2],
                height: AppSizes.getHeight(120, context),
                width: AppSizes.getWidth(120, context),
                fit: BoxFit.contain,
              ),
            ),
            const Gap(16),
            Expanded(
              child: Image.network(
                images[3],
                height: AppSizes.getHeight(120, context),
                width: AppSizes.getWidth(120, context),
                fit: BoxFit.contain,
              ),
            )
          ],
        )
      ],
    );
  }
}
