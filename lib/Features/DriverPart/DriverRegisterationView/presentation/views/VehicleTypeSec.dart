import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/data/models/DrRegisterModel.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/manager/driver_registeration_cubit/driver_registeration_cubit.dart';
import 'package:yallanow/generated/l10n.dart';

class VehicleTypeSec extends StatelessWidget {
  const VehicleTypeSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).VehicleType,
            style: AppStyles.styleMedium16(context)),
        const Gap(8),
        const VehicleTypeBuilder()
      ],
    );
  }
}

class VehicleTypeBuilder extends StatefulWidget {
  const VehicleTypeBuilder({super.key});

  @override
  State<VehicleTypeBuilder> createState() => _VehicleTypeBuilderState();
}

class _VehicleTypeBuilderState extends State<VehicleTypeBuilder> {
  int selectedIndex = -1;
  late DriverRegisterModel driverDetails;
  @override
  void initState() {
    driverDetails =
        BlocProvider.of<DriverRegisterationCubit>(context).driverRegisterModel;
    selectedIndex = 1;
    super.initState();
  }

  String? _validateType(int? r) {
    if (selectedIndex == -1) {
      return S.of(context).vehicleTypeValidation;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: _validateType,
      builder: (FormFieldState<int> state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildVehicleOption(
                    context, 0, Assets.imagesScooterVehicle1, "Wasselny"),
                buildVehicleOption(
                    context, 1, Assets.imagesScooterVehicle2, "Talqa"),
              ],
            ),
            if (state.hasError)
              Column(
                children: [
                  const Gap(8),
                  Text(state.errorText!, style: const TextStyle(color: pKcolor))
                ],
              ),
          ],
        );
      },
    );
  }

  Widget buildVehicleOption(
      BuildContext context, int index, String imagePath, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          log(selectedIndex.toString());
          driverDetails.vehicleType = selectedIndex;
        });
      },
      child: Column(
        children: [
          AnimatedContainer(
            height:
                AppSizes.getHeight(selectedIndex == index ? 120 : 110, context),
            width:
                AppSizes.getWidth(selectedIndex == index ? 120 : 110, context),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color: selectedIndex == index ? pKcolor : Colors.transparent,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            duration: const Duration(milliseconds: 250),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8),
          AnimatedDefaultTextStyle(
            style: selectedIndex == index
                ? AppStyles.styleMedium16(context).copyWith(color: pKcolor)
                : AppStyles.styleMedium14(context),
            duration: const Duration(milliseconds: 250),
            child: Text(label),
          ),
        ],
      ),
    );
  }
}
