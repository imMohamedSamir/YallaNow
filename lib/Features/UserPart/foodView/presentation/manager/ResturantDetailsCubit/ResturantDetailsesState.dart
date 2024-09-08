part of 'ResturantDetailsCubit.dart';

sealed class ResturantDetailsesState extends Equatable {
  const ResturantDetailsesState();

  @override
  List<Object> get props => [];
}

final class ResturantBranchesInitial extends ResturantDetailsesState {}

final class ResturantDetailsLoading extends ResturantDetailsesState {}

final class ResturantDetailsSuccess extends ResturantDetailsesState {
  final RestruntDetails branchDetails;

  const ResturantDetailsSuccess({required this.branchDetails});
}

final class ResturantDetailsFailure extends ResturantDetailsesState {
  final String errmsg;

  const ResturantDetailsFailure({required this.errmsg});
}
