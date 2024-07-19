import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/phone_verification_cubit/phone_verification_cubit.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/OTP_TextField.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/ResendVerifyOTP.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/SignUpAppBar.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/verifyHeader.dart';

class PhoneVerification extends StatelessWidget {
  const PhoneVerification({super.key, this.verificationId, this.isRest});
  final String? verificationId;
  final bool? isRest;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: "Verify", onPressed: () {
        Navigator.pop(context);
      }),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const SizedBox(height: 32),
        const AuthHeader(
            firstHeader: "Phone verification",
            secondHeader: "Enter your OTP code"),
        const SizedBox(height: 40),
        OTPTextField(),
        const SizedBox(height: 20),
        const ResendVerifyOTP(),
        const SizedBox(height: 36),
        BlocBuilder<PhoneVerificationCubit, PhoneVerificationState>(
          builder: (context, state) {
            if (state is PhoneVerificationLoading) {
              return const Center(
                  child: CircularProgressIndicator(color: pKcolor));
            }
            return const SizedBox();
          },
        )
      ]),
    );
  }
}
