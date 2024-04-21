import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Models/register_model.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/Methods/PasswordValidation.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/GenderDropMenu.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/SignupFormButtonBuilder.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  RegisterModel registerModel = RegisterModel();

  String password = '', confirmPassword = '';
  bool p1 = true, p2 = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  hintText: "First Name",
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    registerModel.firstName = value!.trim();
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextField(
                  hintText: "Last Name",
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    registerModel.lastName = value!.trim();
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your E-Mail address';
              }
              if (!value.contains("@")) {
                return 'Please enter correct E-Mail address';
              }
              return null;
            },
            onSaved: (value) {
              registerModel.email = value!.trim();
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintText: "Mobile number",
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your mobile number';
              }
              if (value.length > 11 || value.length < 11) {
                return 'Please enter correct mobile number ';
              }
              return null;
            },
            onSaved: (value) {
              registerModel.phoneNumber = value!.trim();
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
              hintText: "Enter Your Password",
              secure: p1,
              validator: (value) {
                return validatePassword(value);
              },
              onChanged: (p0) {
                password = p0.trim();
              },
              suffixIcon: IconButton(
                icon: Icon(p1
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined),
                onPressed: () {
                  setState(() {
                    p1 = !p1;
                  });
                },
              )),
          const SizedBox(height: 16),
          CustomTextField(
              hintText: "Confirm Password",
              secure: p2,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please Confirm your password';
                }
                if (password != confirmPassword) {
                  return 'Please enter same password';
                }
                return null;
              },
              onChanged: (value) {
                confirmPassword = value.trim();
              },
              onSaved: (value) {
                registerModel.password = value!.trim();
              },
              suffixIcon: IconButton(
                icon: Icon(p2
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined),
                onPressed: () {
                  setState(() {
                    p2 = !p2;
                  });
                },
              )),
          const SizedBox(height: 16),
          Genderdropmenu(
            onChanged: (value) {
              registerModel.gender = value!.trim();
            },
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return '   Please choose your gender';
              }
              return null;
            },
          ),
          const SizedBox(height: 30),
          SignupFormButtonBuilder(
              formKey: _formKey, registerModel: registerModel),
        ],
      ),
    );
  }
}
