import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/manager/driver_registeration_cubit/driver_registeration_cubit.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/views/DrSignupButtonBuilder.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/views/VehicleImgSec.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/views/VehicleTypeSec.dart';

class VehicleDetailsViewBody extends StatelessWidget {
  const VehicleDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Form(
        key: BlocProvider.of<DriverRegisterationCubit>(context).formKey,
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VehicleTypeSec(),
              Gap(16),
              VehicleImgSec(),
              Gap(16),
              DrSignupButtonBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
