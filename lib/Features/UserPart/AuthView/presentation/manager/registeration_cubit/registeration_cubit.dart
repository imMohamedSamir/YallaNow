import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Models/register_model.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Repo/AuthRepo.dart';

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
}
