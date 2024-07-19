import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/TokenManger.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/CaptinHomeView.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryHomeView/presentation/DeliveryHomeView.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Repo/AuthRepo.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/ExternalAuthPage.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/MainHomeView.dart';
import 'package:yallanow/main.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;
  Future<void> fetchLogin(BuildContext context,
      {required String email, required String password}) async {
    emit(LoginLoading());
    var response = await authRepo.fetchLogin(email: email, password: password);
    response.fold((fail) => emit(LoginFailure(errorMessage: fail.errMessage)),
        (logindetails) async {
      if (logindetails.isAuthenticated!) {
        SavedUserDetails userDetails = SavedUserDetails(
            token: logindetails.token!, role: logindetails.roles!.first!);
        TokenManager.saveUserToken(userDetails: userDetails);
        var box = await Hive.openBox<SelectedItemsModel>(kBasket);
        box.clear();
        if (!context.mounted) return;
        if (logindetails.roles!.first == "User") {
          NavigateToPage.slideFromRightandRemove(
              context: context, page: const MainHomeView());
        } else if (logindetails.roles!.first == "Driver") {
          NavigateToPage.slideFromRightandRemove(
              context: context, page: const CaptinHomeView());
        } else {
          NavigateToPage.slideFromRightandRemove(
              context: context, page: const DeliverHomeView());
        }
        emit(LoginSuccess());
      }
    });
  }

  void signinWithGoogle() async {
    emit(LoginLoading());
    var result = await authRepo.signinWithGoogle();
    result.fold((fail) {
      if (fail.errMessage == "User not found.") {
        NavigateToPage.slideFromRight(
            context: navigatorKey.currentContext!,
            page: const ExternalAuthPage());
        emit(LoginInitial());
      } else {
        emit(LoginFailure(errorMessage: fail.errMessage));
      }
    }, (logindetails) async {
      if (logindetails['isAuthSuccessful']) {
        SavedUserDetails userDetails =
            SavedUserDetails(token: logindetails["token"], role: "User");
        TokenManager.saveUserToken(userDetails: userDetails);
        NavigateToPage.slideFromRightandRemove(
            context: navigatorKey.currentContext!, page: const MainHomeView());
        emit(LoginSuccess());
      }
    });
  }

  void signinWithFacebook() async {
    emit(LoginLoading());
    var result = await authRepo.signinWithFaceBook();
    result.fold((fail) {
      if (fail.errMessage == "User not found.") {
        NavigateToPage.slideFromRight(
            context: navigatorKey.currentContext!,
            page: const ExternalAuthPage());
        emit(LoginFailure(errorMessage: ""));
      } else {
        emit(LoginFailure(errorMessage: fail.errMessage));
      }
    }, (logindetails) async {
      if (logindetails['isAuthSuccessful']) {
        SavedUserDetails userDetails =
            SavedUserDetails(token: logindetails["token"], role: "User");
        TokenManager.saveUserToken(userDetails: userDetails);
        NavigateToPage.slideFromRightandRemove(
            context: navigatorKey.currentContext!, page: const MainHomeView());
        emit(LoginSuccess());
      }
    });
  }
}

class SavedUserDetails {
  final String token;
  final String role;

  SavedUserDetails({required this.token, required this.role});
}
