import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Repo/AuthRepo.dart';

part 'password_reset_request_state.dart';

class PasswordResetRequestCubit extends Cubit<PasswordResetRequestState> {
  PasswordResetRequestCubit(this._authRepo)
      : super(PasswordResetRequestInitial());
  final AuthRepo _authRepo;
  void send({required String email}) async {
    emit(PasswordResetRequestLoading());
    var result = await _authRepo.passwordResetRequest(email: email);
    result.fold(
        (fail) => emit(PasswordResetRequestFailure(errMsg: fail.errMessage)),
        (respone) => emit(PasswordResetRequestSuccess()));
  }
}
