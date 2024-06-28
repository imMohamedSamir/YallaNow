import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Models/register_model.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/Methods/PasswordValidation.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/GenderDropMenu.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/SignupFormButtonBuilder.dart';
import 'package:yallanow/generated/l10n.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  UserRegisterModel registerModel = UserRegisterModel();

  String password = '', confirmPassword = '';
  bool p1 = true, p2 = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  hintText: S.of(context).FirstName,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return S.of(context).firstnameValidation;
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
                  hintText: S.of(context).LastName,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return S.of(context).lasnameValidation;
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
            hintText: S.of(context).userName,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return S.of(context).usernameValidation;
              }

              return null;
            },
            onSaved: (value) {
              registerModel.username = value!.trim();
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintText: S.of(context).Email,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return S.of(context).MailValidation;
              }
              if (!value.contains("@")) {
                return S.of(context).correctEmail;
              }
              return null;
            },
            onSaved: (value) {
              registerModel.email = value!.trim();
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintText: S.of(context).PhoneNumber,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return S.of(context).PhoneValidation;
              }
              if (value.length > 11 || value.length < 11) {
                return S.of(context).correctPhoneNumber;
              }
              return null;
            },
            onSaved: (value) {
              registerModel.phoneNumber = value!.trim();
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
              hintText: S.of(context).Password,
              secure: p1,
              maxLines: 1,
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
              hintText: S.of(context).confirmedPassword,
              secure: p2,
              maxLines: 1,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return S.of(context).confirmPassvalidation;
                }
                if (password != confirmPassword) {
                  return S.of(context).confirmPassCorrectation;
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
                return S.of(context).GenderValidation;
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
