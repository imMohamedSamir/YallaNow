import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/data/models/DrRegisterModel.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/manager/DriverFileMangement.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/manager/driver_registeration_cubit/driver_registeration_cubit.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/views/DrRequiredPapers.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/views/DriverPapersBuilder.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/views/VehicleDetailsView.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/views/VehicleImgBuilder.dart';
import 'package:yallanow/generated/l10n.dart';

class DriverDetailsForm extends StatefulWidget {
  const DriverDetailsForm({
    super.key,
  });

  @override
  State<DriverDetailsForm> createState() => _DriverDetailsFormState();
}

class _DriverDetailsFormState extends State<DriverDetailsForm> {
  late TextEditingController textEditingController;
  FileDetails? driverPapers;
  late DriverRegisterModel driverDetails;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  void initState() {
    textEditingController = TextEditingController();
    driverDetails =
        BlocProvider.of<DriverRegisterationCubit>(context).driverRegisterModel;
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          CustomTextField(
            hintText: S.of(context).NId,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return S.of(context).NIdValidation;
              }
              if (value.length > 16 || value.length < 16) {
                return S.of(context).NIDcorrection;
              }
              return null;
            },
            onSaved: (value) {
              driverDetails.nIDcard = value!.trim();
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
              controller: textEditingController,
              hintText: S.of(context).driverPapers,
              readOnly: true,
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return S.of(context).driverPapersValidation;
                }

                return null;
              },
              suffixIcon: IconButton(
                icon: const Icon(Icons.add_box_rounded),
                onPressed: () async {
                  driverPapersDialog(textEditingController);
                },
              )),
          const Gap(16),
          CustomTextField(
            hintText: S.of(context).vehicleModel,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return S.of(context).vehicleModelValidation;
              }

              return null;
            },
            onSaved: (value) {
              driverDetails.vehicleModel = value!.trim();
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintText: S.of(context).VehicleColor,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return S.of(context).vehicleColorValidation;
              }
              return null;
            },
            onSaved: (value) {
              driverDetails.vehicleColor = value!.trim();
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintText: S.of(context).licensePlate,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return S.of(context).licensePlateValidation;
              }

              return null;
            },
            onSaved: (value) {
              driverDetails.licensePlate = value!.trim();
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintText: S.of(context).vehicleYear,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return S.of(context).vehicleYearValidation;
              }

              return null;
            },
            onSaved: (value) {
              driverDetails.vehicleYear = value!.trim();
            },
          ),
          // const SizedBox(height: 16),
          // const RiderRoleSec(),
          const SizedBox(height: 30),
          CustomButton(
            text: S.of(context).Next,
            txtcolor: Colors.white,
            btncolor: pKcolor,
            onPressed: () {
              // NavigateToPage.slideFromRight(
              //     context: context, page: const VehicleDetailsView());
              if (_key.currentState!.validate()) {
                _key.currentState!.save();
                NavigateToPage.slideFromRight(
                    context: context, page: const VehicleDetailsView());
              }
            },
          ),
        ],
      ),
    );
  }

  void driverPapersDialog(TextEditingController textEditingController) {
    showModalBottomSheet(
      // useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          // height: AppSizes.getHeight(700, context),
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 46, bottom: 16),
          child:
              DriverPapersBuilder(textEditingController: textEditingController),
        );
      },
    );
  }
}
