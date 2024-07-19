import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/TokenManger.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Models/external_auth_model/external_auth_model.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Repo/AuthRepo.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/login_cubit/login_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/MainHomeView.dart';
import 'package:yallanow/main.dart';

part 'external_sign_up_state.dart';

class ExternalSignUpCubit extends Cubit<ExternalSignUpState> {
  ExternalSignUpCubit(this._authRepo) : super(ExternalSignUpInitial());
  final AuthRepo _authRepo;
  final formKey = GlobalKey<FormState>();
  ExternalAuthModel authModel = ExternalAuthModel();

  void signUpWithGoogle() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      emit(ExternalSignUpLoading());
      var result = await _authRepo.signiupWithGoogle(authModel: authModel);
      result
          .fold((fail) => emit(ExternalSignUpFailure(errMsg: fail.errMessage)),
              (details) {
        if (details['isAuthSuccessful']) {
          SavedUserDetails userDetails =
              SavedUserDetails(token: details['token'], role: "User");
          TokenManager.saveUserToken(userDetails: userDetails);
          NavigateToPage.slideFromRight(
              context: navigatorKey.currentContext!,
              page: const MainHomeView());
          emit(ExternalSignUpSuccess());
        } else {
          emit(const ExternalSignUpFailure(
              errMsg: "opps ,there an error please try again"));
        }
      });
    }
  }

  void signUpWithFaceBook() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      emit(ExternalSignUpLoading());
      var result = await _authRepo.signiupWithFaceBook(authModel: authModel);
      result
          .fold((fail) => emit(ExternalSignUpFailure(errMsg: fail.errMessage)),
              (details) {
        if (details['isAuthSuccessful']) {
          SavedUserDetails userDetails =
              SavedUserDetails(token: details['token'], role: "User");
          TokenManager.saveUserToken(userDetails: userDetails);
          NavigateToPage.slideFromRight(
              context: navigatorKey.currentContext!,
              page: const MainHomeView());
          emit(ExternalSignUpSuccess());
        } else {
          emit(const ExternalSignUpFailure(
              errMsg: "opps ,there an error please try again"));
        }
      });
    }
  }
}
