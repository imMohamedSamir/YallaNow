import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/ProfileView/data/Repo/ProfileRepo.dart';
import 'package:yallanow/Features/UserPart/ProfileView/data/models/user_profile_details.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit(this.profileRepo) : super(UserDetailsInitial());
  final ProfileRepo profileRepo;
  void fetchUserDetails() async {
    emit(UserDetailsLoading());
    var result = await profileRepo.fetchUserDetails();
    result.fold(
        (fail) => emit(UserDetailsFailure(errMsg: fail.errMessage)),
        (userDetails) =>
            emit(UserDetailsSuccess(userProfileDetails: userDetails)));
  }
}
