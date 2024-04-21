import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/GetLocationPage.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/SignUpAppBar.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/verifyHeader.dart';

class SetPassword extends StatelessWidget {
  const SetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, title: "Password", onPressed: () {
        Navigator.pop(context);
      }),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              AuthHeader(
                  firstHeader: "Set password",
                  secondHeader: "Set your password"),
              SizedBox(height: 40),
              SetPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class SetPasswordForm extends StatefulWidget {
  const SetPasswordForm({
    super.key,
  });

  @override
  State<SetPasswordForm> createState() => _SetPasswordFormState();
}

class _SetPasswordFormState extends State<SetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  String password = '', confirmPassword = '';
  bool p1 = true, p2 = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          CustomTextField(
              hintText: "Enter Your Password",
              secure: p1,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your password';
                }

                return null;
              },
              onChanged: (p0) {
                password = p0.trim();
              },
              onSaved: (value) {},
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
          const SizedBox(height: 20),
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
          SizedBox(height: AppSizes.getHeight(280, context)),
          CustomButton(
            text: "Register",
            txtcolor: Colors.white,
            btncolor: pKcolor,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GetLocationPage(),
                    ));
              }
            },
          ),
        ],
      ),
    );
  }
}
// Navigator.pushReplacement(context,
//                     MaterialPageRoute(builder: (context) => const homeView()));
