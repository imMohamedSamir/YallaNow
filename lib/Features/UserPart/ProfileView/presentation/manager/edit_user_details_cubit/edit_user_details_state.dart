part of 'edit_user_details_cubit.dart';

sealed class EditUserDetailsState extends Equatable {
  const EditUserDetailsState();

  @override
  List<Object> get props => [];
}

final class EditUserDetailsInitial extends EditUserDetailsState {}

final class EditUserDetailsLoading extends EditUserDetailsState {}

final class EditUserDetailsSuccess extends EditUserDetailsState {}

final class EditUserDetailsFailure extends EditUserDetailsState {
  final String errMsg;

  const EditUserDetailsFailure({required this.errMsg});
}
