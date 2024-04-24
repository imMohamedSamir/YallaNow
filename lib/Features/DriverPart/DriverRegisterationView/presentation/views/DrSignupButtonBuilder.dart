// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/data/models/DrRegisterModel.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/manager/driver_registeration_cubit/driver_registeration_cubit.dart';

class DrSignupButtonBuilder extends StatelessWidget {
  const DrSignupButtonBuilder({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.driverRegisterModel,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final DriverRegisterModel driverRegisterModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DriverRegisterationCubit, DriverRegisterationState>(
      builder: (context, state) {
        if (state is DriverRegisterationLoading) {
          return const CircularProgressIndicator(color: pKcolor);
        } else if (state is DriverRegisterationFailure) {
          return Column(
            children: [
              Text(state.errmsg,
                  style: AppStyles.styleRegular16(context)
                      .copyWith(color: pKcolor)),
              const SizedBox(height: 16),
              CustomButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    driverRegisterModel.username =
                        "${driverRegisterModel.firstName}${driverRegisterModel.lastName}";
                    await BlocProvider.of<DriverRegisterationCubit>(context)
                        .fetchDriverRegisteration(
                            driverDetails: driverRegisterModel);
                  }
                },
                text: "Sign Up",
                txtcolor: Colors.white,
                btncolor: const Color(0xffB20404),
              ),
            ],
          );
        } else if (state is DriverRegisterationSuccess) {
          // WidgetsBinding.instance.addPostFrameCallback((_) {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const VerificationSignUp(),
          //     ),
          //   );
          // });

          return CustomButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                driverRegisterModel.username =
                    "${driverRegisterModel.firstName}${driverRegisterModel.lastName}";
                await BlocProvider.of<DriverRegisterationCubit>(context)
                    .fetchDriverRegisteration(
                        driverDetails: driverRegisterModel);
              }
            },
            text: "Sign Up",
            txtcolor: Colors.white,
            btncolor: const Color(0xffB20404),
          );
        } else {
          // Handle other states if necessary
          return CustomButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                driverRegisterModel.username =
                    "${driverRegisterModel.firstName}${driverRegisterModel.lastName}";
                await BlocProvider.of<DriverRegisterationCubit>(context)
                    .fetchDriverRegisteration(
                        driverDetails: driverRegisterModel);
              }
            },
            text: "Sign Up",
            txtcolor: Colors.white,
            btncolor: const Color(0xffB20404),
          ); // Placeholder widget or return null
        }
      },
    );
  }
}
