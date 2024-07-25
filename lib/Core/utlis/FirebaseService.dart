// import 'dart:developer';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class FirebaseService {
//   FirebaseAuth auth = FirebaseAuth.instance;

//   void phoneVerificationFetch(
//       {required String phoneNumber, required BuildContext context}) async {
//     await auth.verifyPhoneNumber(
//       phoneNumber: phoneNumber,
//       ////////verificationComplete//////////////////
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         log(credential.smsCode.toString());
//         // await auth.signInWithCredential(credential);
//       },
//       ////////verificationFailed//////////////////
//       verificationFailed: (FirebaseAuthException e) {
//         if (e.code == 'invalid-phone-number') {
//           log('The provided phone number is not valid.');
//         }
//         log(e.code);
//       },
//       ////////codeSent//////////////////
//       codeSent: (String verificationId, int? resendToken) async {
//         // String smsCode = '123456';

//         // PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         //     verificationId: verificationId, smsCode: smsCode);
//         try {} catch (e) {
//           log(e.toString().contains("invalid-verification-code").toString());
//         }
//       },
//       ///////////codeAutoRetrievalTimeout//////////////
//       codeAutoRetrievalTimeout: (String verificationId) {},
//     );
//   }
// }
