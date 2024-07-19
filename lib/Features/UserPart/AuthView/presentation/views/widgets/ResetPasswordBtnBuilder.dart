import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/LoginView.dart';
import 'package:yallanow/generated/l10n.dart';

class ResetPasswordBtnBuilder extends StatelessWidget {
  const ResetPasswordBtnBuilder({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.email,
    required this.otp,
    required this.newPassword,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final String email, otp, newPassword;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) async {
        if (state is ResetPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            state.errMsg,
            style:
                AppStyles.styleMedium16(context).copyWith(color: Colors.white),
          )));
        } else if (state is ResetPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: const Duration(milliseconds: 450),
              backgroundColor: Colors.green,
              content: Text(
                S.of(context).resetSuccesful,
                style: AppStyles.styleMedium16(context)
                    .copyWith(color: Colors.white),
              )));
          await Future.delayed(const Duration(milliseconds: 500));
          if (!context.mounted) return;
          NavigateToPage.slideFromLeftAndRemove(
              context: context, page: const LoginView());
        }
      },
      builder: (context, state) {
        if (state is ResetPasswordLoading) {
          return const CircularProgressIndicator(color: pKcolor);
        }
        return CustomButton(
          text: S.of(context).Continue,
          txtcolor: Colors.white,
          btncolor: pKcolor,
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              BlocProvider.of<ResetPasswordCubit>(context)
                  .reset(email: email, otp: otp, newPassword: newPassword);
            }
          },
        );
      },
    );
  }
}
