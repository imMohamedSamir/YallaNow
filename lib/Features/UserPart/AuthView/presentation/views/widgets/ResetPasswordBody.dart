import 'package:flutter/material.dart';
import 'package:password_field_validator/password_field_validator.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/Methods/PasswordValidation.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/ResetPasswordBtnBuilder.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/verifyHeader.dart';
import 'package:yallanow/generated/l10n.dart';

class ResetPasswordBody extends StatefulWidget {
  const ResetPasswordBody({super.key, this.email, this.otp});
  final String? email, otp;
  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  TextEditingController passEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode pass1 = AutovalidateMode.disabled;
  AutovalidateMode pass2 = AutovalidateMode.disabled;
  String password = '', confirmPassword = '';

  bool p1 = true, p2 = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    AuthHeader(
                        firstHeader: S.of(context).SetNewpassword,
                        secondHeader: S.of(context).SetNewpasswordMsg),
                    const SizedBox(height: 40),
                    CustomTextField(
                        controller: passEditingController,
                        autovalidateMode: pass1,
                        hintText: S.of(context).Password,
                        secure: p1,
                        maxLines: 1,
                        validator: (value) {
                          return validatePassword(value);
                        },
                        onChanged: (p0) {
                          password = p0.trim();
                          setState(() {
                            pass1 = AutovalidateMode.onUserInteraction;
                          });
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
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                        autovalidateMode: pass2,
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
                          setState(() {
                            pass2 = AutovalidateMode.onUserInteraction;
                          });
                        },
                        onSaved: (value) {},
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
                  ],
                ),
              ),
            ),
            ResetPasswordBtnBuilder(
              formKey: _formKey,
              email: widget.email!,
              otp: widget.otp!,
              newPassword: confirmPassword,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
