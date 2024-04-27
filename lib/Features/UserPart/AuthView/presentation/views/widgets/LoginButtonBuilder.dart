import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Models/LoginPostModel.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/login_cubit/login_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/MainHomeView.dart';

class LoginButtonBuilder extends StatelessWidget {
  const LoginButtonBuilder({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.loginPostModel,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final LoginPostModel loginPostModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state is LoginSuccess) {
          if (state.logindetails.isAuthenticated!) {
            saveUserToken(userToken: state.logindetails.token!);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const MainHomeView()),
                  (route) => false);
            });
          }
        } else if (state is LoginLoading) {
          return CustomButton2(
            txtcolor: const Color(0xffFFFFFF),
            btncolor: const Color(0xffB20404),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                await BlocProvider.of<LoginCubit>(context).fetchLogin(
                    email: loginPostModel.email!,
                    password: loginPostModel.password!);
              }
            },
            child: const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(color: Colors.white)),
          );
        } else if (state is LoginFailure) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(state.errorMessage,
                  style: AppStyles.styleRegular14(context)
                      .copyWith(color: pKcolor)),
              const SizedBox(height: 16),
              CustomButton2(
                text: "Sign In",
                txtcolor: const Color(0xffFFFFFF),
                btncolor: pKcolor,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    await BlocProvider.of<LoginCubit>(context).fetchLogin(
                        email: loginPostModel.email!,
                        password: loginPostModel.password!);
                  }
                },
              )
            ],
          );
        }
        return CustomButton(
          text: "Sign In",
          txtcolor: const Color(0xffFFFFFF),
          btncolor: pKcolor,
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();

              await BlocProvider.of<LoginCubit>(context).fetchLogin(
                  email: loginPostModel.email!,
                  password: loginPostModel.password!);
            }
          },
        );
      },
    );
  }

  Future<void> saveUserToken({required String userToken}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(token, userToken);
  }
}
