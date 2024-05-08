part of 'resturant_branches_cubit.dart';

sealed class ResturantBranchesState extends Equatable {
  const ResturantBranchesState();

  @override
  List<Object> get props => [];
}

final class ResturantBranchesInitial extends ResturantBranchesState {}

final class ResturantBranchesLoading extends ResturantBranchesState {}

final class ResturantBranchesSuccess extends ResturantBranchesState {
  final RestruntDetails branchDetails;

  ResturantBranchesSuccess({required this.branchDetails});
}

final class ResturantBranchesFailure extends ResturantBranchesState {
  final String errmsg;

  ResturantBranchesFailure({required this.errmsg});
}
