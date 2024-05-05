import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Models/login_response_model.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Repo/AuthRepo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;
  Future<void> fetchLogin(
      {required String email, required String password}) async {
    emit(LoginLoading());
    var response = await authRepo.fetchLogin(email: email, password: password);
    response.fold((fail) => emit(LoginFailure(errorMessage: fail.errorMessage)),
        (logindetails) {
      if (logindetails.isAuthenticated!) {
        saveUserToken(userToken: logindetails.token!);
        emit(LoginSuccess(logindetails: logindetails));
      }
    });
  }

  Future<void> saveUserToken({required String userToken}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(token, userToken);
  }
}
