import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/SignUpAppBar.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/forgetPasswordVerify.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/verifyHeader.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  String? EmailOrPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, title: "Forget password ", onPressed: () {
        Navigator.pop(context);
      }),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const AuthHeader(
                  firstHeader: "Verifivation email or phone number",
                  secondHeader: ""),
              const SizedBox(height: 40),
              CustomTextField(
                hintText: "Email or phone number",
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your Email or phone number';
                  }
                  return null;
                },
                onSaved: (value) {
                  EmailOrPassword = value!.trim();
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const forgetPasswordVerify()));
                  }
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
