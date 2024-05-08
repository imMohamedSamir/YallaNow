part of 'mart_details_cubit.dart';

sealed class MartDetailsState extends Equatable {
  const MartDetailsState();

  @override
  List<Object> get props => [];
}

final class MartDetailsInitial extends MartDetailsState {}

final class MartDetailsLoading extends MartDetailsState {}

final class MartDetailsSuccess extends MartDetailsState {
  final List<MartDetailsModel> martsDetails;

  const MartDetailsSuccess({required this.martsDetails});
}

final class MartDetailsFailuer extends MartDetailsState {
  final String errMsg;

  const MartDetailsFailuer({required this.errMsg});
}
