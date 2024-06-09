import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/Methods/phoneOrMailValidation.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/registeration_cubit/registeration_cubit.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/verifyHeader.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({
    super.key,
  });

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  final _formKey = GlobalKey<FormState>();
  String? emailOrPassword;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            const AuthHeader(
                firstHeader: "Verifivation email or phone number",
                secondHeader: ""),
            const SizedBox(height: 40),
            CustomTextField(
              hintText: "Email or phone number",
              validator: (value) {
                return phoneOrMailValidation(value);
              },
              onSaved: (value) {
                emailOrPassword = value!.trim();
              },
            ),
            const Spacer(),
            CustomButton(
              text: "Continue",
              txtcolor: const Color(0xffFFFFFF),
              btncolor: const Color(0xffB20404),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  var isPhone = phoneOrMailCheck(emailOrPassword);
                  log(isPhone.toString());
                  if (isPhone ?? false) {
                    // BlocProvider.of<RegisterationCubit>(context)
                    //     .phoneVerificationFetch(
                    //         phoneNumber: emailOrPassword!,
                    //         context: context,
                    //         isRest: true);
                  }
                }
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
