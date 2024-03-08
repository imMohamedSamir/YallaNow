import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/GenderDropMenu.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  late String name, email, mobile, gender;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            hintText: "Name",
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your E-Mail address';
                }
                return null;
              },
              hintText: "Email",
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next),
          const SizedBox(height: 16),
          CustomTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your mobile number';
              }
              return null;
            },
            hintText: "Mobile number",
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16),
          Genderdropmenu(
            onSelected: (value) {
              if (value == null || value.isEmpty) {
                gender = value!;
              } else {}
            },
          ),
          const SizedBox(height: 30),
          CustomButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Form is valid, perform actions here
                } else {
                  // Form is invalid, display error messages or take other actions
                }
              },
              text: "Sign Up",
              color: Colors.white,
              btncolor: const Color(0xffB20404)),
        ],
      ),
    );
  }
}
