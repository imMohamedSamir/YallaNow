part of 'captin_details_cubit.dart';

sealed class CaptinDetailsState extends Equatable {
  const CaptinDetailsState();

  @override
  List<Object> get props => [];
}

final class CaptinDetailsInitial extends CaptinDetailsState {}

final class CaptinDetailsLoading extends CaptinDetailsState {}

final class CaptinDetailsSuccess extends CaptinDetailsState {
  final CaptinDetailsModel detailsModel;

  const CaptinDetailsSuccess({required this.detailsModel});
}

final class CaptinDetailsFailure extends CaptinDetailsState {
  final String errMsg;

  const CaptinDetailsFailure({required this.errMsg});
}
