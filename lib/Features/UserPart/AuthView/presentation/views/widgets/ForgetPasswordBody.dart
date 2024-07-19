import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/Methods/phoneOrMailValidation.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/password_reset_request_cubit/password_reset_request_cubit.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/forgetPasswordVerify.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/verifyHeader.dart';
import 'package:yallanow/generated/l10n.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({
    super.key,
  });

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            AuthHeader(
                firstHeader: S.of(context).VerificationWithMail,
                secondHeader: S.of(context).VerificationWithMailMsg),
            const SizedBox(height: 40),
            CustomTextField(
              keyboardType: TextInputType.emailAddress,
              hintText: S.of(context).Email,
              validator: (value) {
                return phoneOrMailValidation(value);
              },
              onChanged: (value) {
                _email = value.trim();
              },
              onSaved: (value) {
                _email = value!.trim();
              },
            ),
            const Spacer(),
            BlocConsumer<PasswordResetRequestCubit, PasswordResetRequestState>(
                listener: (context, state) {
              if (state is PasswordResetRequestFailure) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                  state.errMsg,
                  style: AppStyles.styleMedium16(context)
                      .copyWith(color: Colors.white),
                )));
              } else if (state is PasswordResetRequestSuccess) {
                NavigateToPage.slideFromRight(
                    context: context,
                    page: ForgetPasswordVerify(email: _email));
              }
            }, builder: (context, state) {
              if (state is PasswordResetRequestLoading) {
                return const CircularProgressIndicator(color: pKcolor);
              }
              return CustomButton(
                text: S.of(context).Continue,
                txtcolor: const Color(0xffFFFFFF),
                btncolor: pKcolor,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    BlocProvider.of<PasswordResetRequestCubit>(context)
                        .send(email: _email!);
                  }
                },
              );
            }),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
