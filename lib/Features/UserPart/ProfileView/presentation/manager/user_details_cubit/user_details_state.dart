part of 'user_details_cubit.dart';

sealed class UserDetailsState extends Equatable {
  const UserDetailsState();

  @override
  List<Object> get props => [];
}

final class UserDetailsInitial extends UserDetailsState {}

final class UserDetailsLoading extends UserDetailsState {}

final class UserDetailsSuccess extends UserDetailsState {
  final UserProfileDetails userProfileDetails;

  UserDetailsSuccess({required this.userProfileDetails});
}

final class UserDetailsFailure extends UserDetailsState {
  final String errMsg;

  UserDetailsFailure({required this.errMsg});
}
