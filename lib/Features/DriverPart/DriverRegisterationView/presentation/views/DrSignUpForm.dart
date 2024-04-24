import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/data/models/DrRegisterModel.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/manager/DriverFileMangement.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/views/DrSignupButtonBuilder.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/Methods/PasswordValidation.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/GenderDropMenu.dart';
import 'package:yallanow/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DrSignUpForm extends StatefulWidget {
  const DrSignUpForm({super.key});

  @override
  State<DrSignUpForm> createState() => _DrSignUpFormState();
}

class _DrSignUpFormState extends State<DrSignUpForm> {
  final _formKey = GlobalKey<FormState>();
  DriverRegisterModel driverRegisterModel = DriverRegisterModel();
  FileDetails? driverPapers;
  String password = '', confirmPassword = '';
  bool p1 = true, p2 = true;
  TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

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
                  hintText: S.of(context).FirstName,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    driverRegisterModel.firstName = value!.trim();
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
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    driverRegisterModel.lastName = value!.trim();
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintText: S.of(context).Email,
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
              driverRegisterModel.email = value!.trim();
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintText: S.of(context).PhoneNumber,
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
              driverRegisterModel.phoneNumber = value!.trim();
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
              hintText: S.of(context).Password,
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
              hintText: S.of(context).confirmedPassword,
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
                driverRegisterModel.password = value!.trim();
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
              driverRegisterModel.gender = value!.trim();
            },
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return '   Please choose your gender';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintText: S.of(context).NId,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your National ID';
              }
              if (value.length > 16 || value.length < 16) {
                return 'National ID should be 16 digits';
              }
              return null;
            },
            onSaved: (value) {
              driverRegisterModel.nIDcard = value!.trim();
            },
          ),
          const SizedBox(height: 16),
          Directionality(
            textDirection: TextDirection.rtl,
            child: CustomTextField(
                controller: textEditingController,
                hintText: "    ${S.of(context).feesh}",
                readOnly: true,
                validator: (p0) {
                  if (driverPapers == null) {
                    return 'الرجاء ارفاق الملفات المطلوبه';
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add_link_rounded),
                  onPressed: () async {
                    driverPapers = await DriverFileMangement().pickFile();
                    setState(() {
                      driverRegisterModel.driverPapers = driverPapers;
                      textEditingController.text =
                          "  ${driverPapers!.fileName ?? ""}";
                    });
                  },
                )),
          ),
          CustomButton(
            text: "press",
            txtcolor: Colors.white,
            btncolor: pKcolor,
            onPressed: () async {
              await FirebaseAuth.instance.verifyPhoneNumber(
                phoneNumber: '+20 1127523369',
                verificationCompleted: (PhoneAuthCredential credential) {
                  log(credential.smsCode.toString());
                },
                verificationFailed: (FirebaseAuthException e) {
                  log(e.message.toString());
                },
                codeSent: (String verificationId, int? resendToken) {},
                codeAutoRetrievalTimeout: (String verificationId) {},
              );
            },
          ),
          const SizedBox(height: 30),
          DrSignupButtonBuilder(
              formKey: _formKey, driverRegisterModel: driverRegisterModel),
        ],
      ),
    );
  }
}
