import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Core/utlis/TokenManger.dart';
import 'package:yallanow/Features/UserPart/ProfileView/data/Repo/ProfileRepo.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit(this._profileRepo) : super(DeleteAccountInitial());
  final ProfileRepo _profileRepo;
  void delete() async {
    emit(DeleteAccountLoading());
    var result = await _profileRepo.deletAccount();
    result.fold((fail) => emit(DeleteAccountFailure(errMsg: fail.errMessage)),
        (s) async {
      await TokenManager.removeToken();
      emit(DeleteAccountSuccess());
    });
  }
}
