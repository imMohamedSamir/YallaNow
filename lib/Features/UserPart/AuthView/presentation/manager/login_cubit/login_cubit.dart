import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/TokenManger.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/CaptinHomeView.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryHomeView/presentation/DeliveryHomeView.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Models/login_response_model.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Repo/AuthRepo.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/MainHomeView.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;
  Future<void> fetchLogin(BuildContext context,
      {required String email, required String password}) async {
    emit(LoginLoading());
    var response = await authRepo.fetchLogin(email: email, password: password);
    response.fold((fail) => emit(LoginFailure(errorMessage: fail.errorMessage)),
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
        emit(LoginSuccess(logindetails: logindetails));
      }
    });
  }
}

class SavedUserDetails {
  final String token;
  final String role;

  SavedUserDetails({required this.token, required this.role});
}
