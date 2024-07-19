import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Repo/AuthRepo.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/ResetPasswordPage.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  VerifyOtpCubit(this._authRepo) : super(VerifyOtpInitial());
  final TextEditingController textEditingController = TextEditingController();
  final AuthRepo _authRepo;
  void verifyOtp(BuildContext context,
      {required String email, required String otp}) async {
    emit(VerifyOtpLoading());
    var result = await _authRepo.verifyOTP(email: email, otp: otp);
    result.fold((fail) => emit(VerifyOtpFailure(errMsg: fail.errMessage)),
        (response) async {
      emit(VerifyOtpSuccess());
      await Future.delayed(const Duration(milliseconds: 450));
      if (!context.mounted) return;
      NavigateToPage.slideFromRight(
          context: context, page: ResetPasswordPage(email: email, otp: otp));
    });
  }

  void setInitial() {
    textEditingController.clear();
    emit(VerifyOtpInitial());
  }
}
