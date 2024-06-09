import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/ProfileView/data/Repo/ProfileRepo.dart';
import 'package:yallanow/Features/UserPart/ProfileView/data/models/user_profile_details.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit(this.profileRepo) : super(UserDetailsInitial());
  final ProfileRepo profileRepo;

  void fetchUserDetails() async {
    if (isClosed) return;

    emit(UserDetailsLoading());
    var result = await profileRepo.fetchUserDetails();

    if (isClosed) return;

    result.fold(
      (fail) {
        if (!isClosed) emit(UserDetailsFailure(errMsg: fail.errMessage));
      },
      (userDetails) {
        if (!isClosed) {
          emit(UserDetailsSuccess(userProfileDetails: userDetails));
        }
      },
    );
  }
}
