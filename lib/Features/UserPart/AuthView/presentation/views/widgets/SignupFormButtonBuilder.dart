import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Models/register_model.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/registeration_cubit/registeration_cubit.dart';

class SignupFormButtonBuilder extends StatelessWidget {
  const SignupFormButtonBuilder({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.registerModel,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final UserRegisterModel registerModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterationCubit, RegisterationState>(
      builder: (context, state) {
        if (state is RegisterationLoading) {
          return const CircularProgressIndicator(color: pKcolor);
        } else if (state is RegisterationFailure) {
          return Column(
            children: [
              Text(state.failmsg,
                  style: AppStyles.styleRegular16(context)
                      .copyWith(color: pKcolor)),
              const SizedBox(height: 16),
              CustomButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    registerModel.username =
                        "${registerModel.firstName}${registerModel.lastName}";
                    await BlocProvider.of<RegisterationCubit>(context)
                        .fetchRegisteration(userdata: registerModel);
                  }
                },
                text: "Sign Up",
                txtcolor: Colors.white,
                btncolor: const Color(0xffB20404),
              ),
            ],
          );
        } else if (state is RegisterationSuccess) {
          if (state.respons == '["User"]') {
            BlocProvider.of<RegisterationCubit>(context).phoneVerificationFetch(
                phoneNumber: "+2${registerModel.phoneNumber!}",
                context: context);
          }
          return CustomButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                registerModel.username =
                    "${registerModel.firstName}${registerModel.lastName}";
                await BlocProvider.of<RegisterationCubit>(context)
                    .fetchRegisteration(userdata: registerModel);
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
                registerModel.username =
                    "${registerModel.firstName}${registerModel.lastName}";
                await BlocProvider.of<RegisterationCubit>(context)
                    .fetchRegisteration(userdata: registerModel);
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
