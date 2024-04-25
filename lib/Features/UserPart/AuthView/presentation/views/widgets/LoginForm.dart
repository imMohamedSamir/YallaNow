import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/LoginButtonBuilder.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/forgetPassQ.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/scooter_location_cubit/scooter_location_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool secure = true;
  final _formKey = GlobalKey<FormState>();
  LoginPostModel loginPostModel = LoginPostModel();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          CustomTextField(
            hintText: "Email or Phone Number",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your Email or Phone Number';
              }
              return null;
            },
            onSaved: (value) {
              loginPostModel.email = value!.trim();
            },
          ),
          const SizedBox(height: 30),
          CustomTextField(
            hintText: "Enter Your Password",
            secure: secure,
            suffixIcon: IconButton(
              icon: Icon(secure == true
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined),
              onPressed: () {
                secure = !secure;
                setState(() {});
              },
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            onSaved: (value) {
              loginPostModel.password = value!.trim();
            },
          ),
          const SizedBox(height: 10),
          const ForgetPasswordSec(),
          const SizedBox(height: 30),
          LoginButtonBuilder(
            formKey: _formKey,
            loginPostModel: loginPostModel,
          ),
        ],
      ),
    );
  }
}

class LoginPostModel {
  String? email, password;

  LoginPostModel({this.email, this.password});
}
