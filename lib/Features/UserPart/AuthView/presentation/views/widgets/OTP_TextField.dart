import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/phone_verification_cubit/phone_verification_cubit.dart';

class OTPTextField extends StatelessWidget {
  const OTPTextField({super.key, required this.verificationId, this.isRest});
  final String verificationId;
  final bool? isRest;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneVerificationCubit, PhoneVerificationState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Pinput(
            length: 6,
            forceErrorState: state is PhoneVerificationFail,
            errorText: state is PhoneVerificationFail ? state.errmsg : null,
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
            submittedPinTheme: state is PhoneVerificationSuccess
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
              BlocProvider.of<PhoneVerificationCubit>(context)
                  .phoneVerificationFetch(
                      verificationId: verificationId,
                      smsCode: value,
                      context: context,
                      isRest: isRest);
            },
          ),
        );
      },
    );
  }
}
