import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_field_validator/password_field_validator.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/manager/DriverFileMangement.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/manager/driver_registeration_cubit/driver_registeration_cubit.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/views/DrSignupButtonBuilder.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/views/DriverDetailsView.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/views/DriverImgSec.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/views/RiderRoleRadio.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/Methods/PasswordValidation.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/GenderDropMenu.dart';
import 'package:yallanow/generated/l10n.dart';

class DrSignUpForm extends StatefulWidget {
  const DrSignUpForm({super.key});

  @override
  State<DrSignUpForm> createState() => _DrSignUpFormState();
}

class _DrSignUpFormState extends State<DrSignUpForm> {
  final _formKey = GlobalKey<FormState>();
  FileDetails? driverPapers;
  String password = '', confirmPassword = '';
  bool p1 = true, p2 = true;
  TextEditingController textEditingController = TextEditingController();
  TextEditingController passEditingController = TextEditingController();
  AutovalidateMode autovalidateModePass = AutovalidateMode.disabled;
  AutovalidateMode autovalidateModeEmail = AutovalidateMode.disabled;
  AutovalidateMode autovalidateModeFname = AutovalidateMode.disabled;
  AutovalidateMode autovalidateModeLname = AutovalidateMode.disabled;
  AutovalidateMode autovalidateModeUserName = AutovalidateMode.disabled;
  AutovalidateMode autovalidateModephone = AutovalidateMode.disabled;
  AutovalidateMode autovalidateModeGender = AutovalidateMode.disabled;
  DriverRegisterationCubit? cubit;
  @override
  void initState() {
    cubit = BlocProvider.of<DriverRegisterationCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Align(alignment: Alignment.center, child: DriverImgSec()),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  autovalidateMode: autovalidateModeFname,
                  hintText: S.of(context).FirstName,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return S.of(context).firstnameValidation;
                    }
                    return null;
                  },
                  onSaved: (value) {
                    cubit!.driverRegisterModel.firstName = value!.trim();
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
                    cubit!.driverRegisterModel.lastName = value!.trim();
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintText: S.of(context).userName,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return S.of(context).usernameValidation;
              }

              return null;
            },
            onSaved: (value) {
              cubit!.driverRegisterModel.username = value!.trim();
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintText: S.of(context).Email,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            // onChanged: (p0) {
            //   autovalidateModeEmail = AutovalidateMode.onUserInteraction;
            // },
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
              cubit!.driverRegisterModel.email = value!.trim();
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintText: S.of(context).address,
            keyboardType: TextInputType.streetAddress,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return S.of(context).addressValidation;
              }

              return null;
            },
            onSaved: (value) {
              cubit!.driverRegisterModel.address = value!.trim();
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
              cubit!.driverRegisterModel.phoneNumber = value!.trim();
            },
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              CustomTextField(
                  controller: passEditingController,
                  hintText: S.of(context).Password,
                  maxLines: 1,
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
              Padding(
                padding: const EdgeInsets.all(8),
                child: PasswordFieldValidator(
                  controller: passEditingController,
                  minLength: 8,
                  uppercaseCharCount: 1,
                  lowercaseCharCount: 1,
                  numericCharCount: 1,
                  specialCharCount: 1,
                  defaultColor: pKcolor,
                  successColor: Colors.green,
                  failureColor: pKcolor,
                  minLengthMessage: S.of(context).atLest8,
                  uppercaseCharMessage: S.of(context).upperCaseLetter,
                  lowercaseMessage: S.of(context).lowerCaseLetter,
                  numericCharMessage: S.of(context).numericCharacter,
                  specialCharacterMessage: S.of(context).specialCharacter,
                ),
              )
            ],
          ),
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
                cubit!.driverRegisterModel.password = value!.trim();
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
              cubit!.driverRegisterModel.gender = value!.trim();
            },
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return S.of(context).GenderValidation;
              }
              return null;
            },
          ),
          const SizedBox(height: 30),
          CustomButton(
            text: S.of(context).Next,
            txtcolor: Colors.white,
            btncolor: pKcolor,
            onPressed: () {
              // NavigateToPage.slideFromRight(
              //     context: context, page: const DriverDetailsView());
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                NavigateToPage.slideFromRight(
                    context: context, page: const DriverDetailsView());
              }
            },
          ),
        ],
      ),
    );
  }
}
