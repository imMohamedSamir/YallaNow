import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Models/LoginPostModel.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/LoginButtonBuilder.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/forgetPassQ.dart';
import 'package:yallanow/generated/l10n.dart';

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
  AutovalidateMode autovalidateModePass = AutovalidateMode.disabled;
  AutovalidateMode autovalidateModeEmail = AutovalidateMode.disabled;

  LoginPostModel loginPostModel = LoginPostModel();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            hintText: S.of(context).Email,
            autovalidateMode: autovalidateModeEmail,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).MailValidation;
              }
              return null;
            },
            onChanged: (p0) {
              setState(() {
                autovalidateModeEmail = AutovalidateMode.onUserInteraction;
              });
            },
            onSaved: (value) {
              loginPostModel.email = value!.trim();
            },
          ),
          const SizedBox(height: 30),
          CustomTextField(
            hintText: S.of(context).Password,
            autovalidateMode: autovalidateModePass,
            maxLines: 1,
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
                return S.of(context).PassValidation;
              }
              return null;
            },
            onChanged: (p0) {
              setState(() {
                autovalidateModePass = AutovalidateMode.onUserInteraction;
              });
            },
            onSaved: (value) {
              loginPostModel.password = value!.trim();
            },
          ),
          const SizedBox(height: 10),
          const ForgetPasswordSec(),
          const SizedBox(height: 30),
          LoginButtonBuilder(formKey: _formKey, loginPostModel: loginPostModel),
        ],
      ),
    );
  }
}
