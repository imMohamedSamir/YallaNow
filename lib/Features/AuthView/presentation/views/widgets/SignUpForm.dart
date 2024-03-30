import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/GenderDropMenu.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/VerificationSignUp.dart';

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
            onSaved: (value) {
              name = value!.trim();
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your E-Mail address';
              }
              if (!value.contains("@")) {
                return 'Please enter correct E-Mail address';
              }
              return null;
            },
            onSaved: (value) {
              email = value!.trim();
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintText: "Mobile number",
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your mobile number';
              }
              if (value.length > 11 || value.length < 11) {
                return 'Please enter correct mobile number ';
              }
              return null;
            },
            onSaved: (value) {
              mobile = value!.trim();
            },
          ),
          const SizedBox(height: 16),
          Genderdropmenu(
            onChanged: (value) {
              gender = value!;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '   Please choose your gender';
              }
              return null;
            },
          ),
          const SizedBox(height: 30),
          CustomButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  print(
                      "name: $name , gender: $gender,mobile: $mobile ,email: $email");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VerificationSignUp()));
                } else {
                  // Form is invalid, display error messages or take other actions
                }
              },
              text: "Sign Up",
              txtcolor: Colors.white,
              btncolor: const Color(0xffB20404)),
        ],
      ),
    );
  }
}
