import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/LoginView.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/ResetPassword.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/MainHomeView.dart';

part 'phone_verification_state.dart';

class PhoneVerificationCubit extends Cubit<PhoneVerificationState> {
  PhoneVerificationCubit() : super(PhoneVerificationInitial());
  FirebaseAuth auth = FirebaseAuth.instance;

  void phoneVerificationFetch(
      {required String verificationId,
      required String smsCode,
      required BuildContext context,
      @required bool? isRest}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);

    try {
      emit(PhoneVerificationLoading());
      await auth.signInWithCredential(credential);
      emit(PhoneVerificationSuccess());

      if (isRest!) {
        if (!context.mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ResetPassword(),
          ),
        );
      } else {
        if (!context.mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginView(),
          ),
        );
      }
    } catch (e) {
      if (e.toString().contains("invalid-verification-code")) {
        emit(PhoneVerificationFail(
            errmsg: "Please enter the correct verification code again"));
      }
    }
  }
}
