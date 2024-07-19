import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Repo/AuthRepo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this._authRepo) : super(ResetPasswordInitial());
  final AuthRepo _authRepo;
  void reset(
      {required String email,
      required String otp,
      required String newPassword}) async {
    emit(ResetPasswordLoading());
    var result = await _authRepo.resetPassword(
        email: email, otp: otp, newPassword: newPassword);
    result.fold((fail) => emit(ResetPasswordFailure(errMsg: fail.errMessage)),
        (response) {
      emit(ResetPasswordSuccess());
    });
  }
}
