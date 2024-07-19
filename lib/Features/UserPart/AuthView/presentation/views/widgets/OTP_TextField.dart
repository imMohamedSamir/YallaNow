import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/verify_otp_cubit/verify_otp_cubit.dart';

class OTPTextField extends StatelessWidget {
  const OTPTextField({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocBuilder<VerifyOtpCubit, VerifyOtpState>(
        builder: (context, state) {
          return Pinput(
            pinAnimationType: PinAnimationType.scale,
            animationDuration: const Duration(milliseconds: 250),
            controller:
                BlocProvider.of<VerifyOtpCubit>(context).textEditingController,
            length: 6,
            forceErrorState: state is VerifyOtpFailure,
            errorText: state is VerifyOtpFailure ? state.errMsg : null,
            errorTextStyle:
                AppStyles.styleMedium14(context).copyWith(color: Colors.red),
            errorPinTheme: PinTheme(
                textStyle: AppStyles.styleMedium16(context),
                margin: const EdgeInsets.only(left: 8),
                width: 55,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 2, color: Colors.red),
                )),
            submittedPinTheme: state is VerifyOtpSuccess
                ? PinTheme(
                    textStyle: AppStyles.styleMedium16(context),
                    margin: const EdgeInsets.only(left: 8),
                    width: 55,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 2, color: Colors.green),
                    ))
                : null,
            defaultPinTheme: PinTheme(
                textStyle: AppStyles.styleMedium16(context),
                margin: const EdgeInsets.only(left: 8),
                width: 50,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xff9E9D9D)),
                )),
            focusedPinTheme: PinTheme(
                textStyle: AppStyles.styleMedium16(context),
                margin: const EdgeInsets.only(left: 8),
                width: 55,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 2, color: const Color(0xff9E9D9D)),
                )),
            onCompleted: (value) async {
              BlocProvider.of<VerifyOtpCubit>(context)
                  .verifyOtp(context, email: email!, otp: value);
            },
          );
        },
      ),
    );
  }
}
