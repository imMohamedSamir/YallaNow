// ignore: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/manager/driver_registeration_cubit/driver_registeration_cubit.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/LoginView.dart';

class DrSignupButtonBuilder extends StatelessWidget {
  const DrSignupButtonBuilder({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriverRegisterationCubit, DriverRegisterationState>(
      listener: (context, state) {
        if (state is DriverRegisterationSuccess) {
          NavigateToPage.slideFromRight(
              context: context, page: const LoginView());
        }
      },
      builder: (context, state) {
        if (state is DriverRegisterationLoading) {
          return const CircularProgressIndicator(color: pKcolor);
        } else if (state is DriverRegisterationFailure) {
          return _buildFailureState(context, state.errmsg);
        }
        return _buildSignupButton(context);
      },
    );
  }

  Widget _buildSignupButton(BuildContext context) {
    return CustomButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          await BlocProvider.of<DriverRegisterationCubit>(context)
              .fetchDriverRegisteration();
        }
      },
      text: "Sign Up",
      txtcolor: Colors.white,
      btncolor: pKcolor,
    );
  }

  Widget _buildFailureState(BuildContext context, String errorMsg) {
    return Column(
      children: [
        Text(
          errorMsg,
          style: AppStyles.styleRegular16(context).copyWith(color: pKcolor),
        ),
        const SizedBox(height: 16),
        _buildSignupButton(context),
      ],
    );
  }
}
