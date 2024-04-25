import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Models/register_model.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Repo/AuthRepo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/PhoneVerification.dart';

part 'registeration_state.dart';

class RegisterationCubit extends Cubit<RegisterationState> {
  RegisterationCubit(this.authRepo) : super(RegisterationInitial());
  final AuthRepo authRepo;
  Future<void> fetchRegisteration({required UserRegisterModel userdata}) async {
    emit(RegisterationLoading());
    var respons = await authRepo.fetchRegisteration(userdata: userdata);
    respons.fold(
        (failure) => emit(RegisterationFailure(failmsg: failure.errorMessage)),
        (response) => emit(RegisterationSuccess(respons: response)));
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  void phoneVerificationFetch(
      {required String phoneNumber,
      required BuildContext context,
      bool isRest = false}) async {
    await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        ////////verificationComplete//////////////////
        verificationCompleted: (PhoneAuthCredential credential) async {
          log(credential.smsCode.toString());
          // await auth.signInWithCredential(credential);
        },
        ////////verificationFailed//////////////////
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            log('The provided phone number is not valid.');
          }
          log(e.code);
        },
        ////////codeSent//////////////////
        codeSent: (String verificationId, int? resendToken) async {
          log(verificationId);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PhoneVerification(
                verificationId: verificationId,
                isRest: isRest,
              ),
            ),
          );
          // String smsCode = '123456';

          // PhoneAuthCredential credential = PhoneAuthProvider.credential(
          //     verificationId: verificationId, smsCode: smsCode);
          // try {} catch (e) {
          //   log(e.toString().contains("invalid-verification-code").toString());
          // }
        },
        ///////////codeAutoRetrievalTimeout//////////////
        codeAutoRetrievalTimeout: (String verificationId) {},
        timeout: const Duration(seconds: 50));
  }
}
