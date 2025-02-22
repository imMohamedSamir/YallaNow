import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Models/LoginPostModel.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/login_cubit/login_cubit.dart';
import 'package:yallanow/generated/l10n.dart';

class LoginButtonBuilder extends StatelessWidget {
  const LoginButtonBuilder({
    super.key,
    required this.formKey,
    required this.loginPostModel,
  });

  final GlobalKey<FormState> formKey;
  final LoginPostModel loginPostModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            state.errorMessage,
            style:
                AppStyles.styleMedium16(context).copyWith(color: Colors.white),
          )));
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return const CircularProgressIndicator(color: pKcolor);
        }

        return CustomButton(
          text: S.of(context).SignIn,
          txtcolor: const Color(0xffFFFFFF),
          btncolor: pKcolor,
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              await BlocProvider.of<LoginCubit>(context).fetchLogin(
                context,
                email: loginPostModel.email!,
                password: loginPostModel.password!,
              );
            }
          },
        );
      },
    );
  }
}
