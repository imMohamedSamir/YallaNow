import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/forgetPassQ.dart';
import 'package:yallanow/Features/homeView/presentation/homeView.dart';

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
  String? emailOrphone, password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            hintText: "Email or Phone Number",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your Email or Phone Number';
              }
              return null;
            },
            onSaved: (value) {
              emailOrphone = value!.trim();
            },
          ),
          const SizedBox(height: 30),
          CustomTextField(
            hintText: "Enter Your Password",
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
                return 'Please enter your password';
              }
              return null;
            },
            onSaved: (value) {
              password = value!.trim();
            },
          ),
          const SizedBox(height: 10),
          const forgetPasswordSec(),
          const SizedBox(height: 30),
          CustomButton(
            text: "Sign In",
            txtcolor: const Color(0xffFFFFFF),
            btncolor: const Color(0xffB20404),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                print("emailorphone :$emailOrphone,password:$password");
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const homeView()));
              }
            },
          ),
        ],
      ),
    );
  }
}
