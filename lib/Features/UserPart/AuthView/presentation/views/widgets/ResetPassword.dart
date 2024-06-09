import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/functions/getCurrentLocation.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/GetLocationPage.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/SignUpAppBar.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/verifyHeader.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();

  String? password;
  bool F1 = true, F2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: "Forget password ", onPressed: () {
        Navigator.pop(context);
      }),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 30),
                      const AuthHeader(
                          firstHeader: "Set New password",
                          secondHeader: "Set your new password"),
                      const SizedBox(height: 40),
                      CustomTextField(
                        hintText: "Enter Your New Password",
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your New Password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          password = value!.trim();
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        hintText: "Confirm Password",
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please confirm your New Password';
                          }
                          if (value != password) {
                            print("password:$password,value:$value");
                            return "Please enter same password";
                          }
                          return null;
                        },
                        secure: F2,
                        suffixIcon: IconButton(
                          icon: Icon(F2 == true
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                          onPressed: () {
                            F2 = !F2;
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                text: " Save ",
                txtcolor: Colors.white,
                btncolor: const Color(0xffB20404),
                onPressed: () async {
                  // if (_formKey.currentState!.validate()) {
                  //   _formKey.currentState!.save();
                  //   bool serviceIsEnabled =
                  //       await CurrentLocation().checkServiceLocation();
                  //   if (!serviceIsEnabled) {
                  //     // ignore: use_build_context_synchronously
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => const GetLocationPage()));
                  //   } else {}
                  // }
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
