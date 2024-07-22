part of 'captin_drawer_cubit.dart';

sealed class CaptinDrawerState extends Equatable {
  const CaptinDrawerState();

  @override
  List<Object> get props => [];
}

final class CaptinDrawerInitial extends CaptinDrawerState {}

final class CaptinDrawerLoading extends CaptinDrawerState {}

final class CaptinDrawerSuccess extends CaptinDrawerState {
  final CaptinDrawerDetailsModel detailsModel;

  const CaptinDrawerSuccess({required this.detailsModel});
}

final class CaptinDrawerFailure extends CaptinDrawerState {
  final String message;

  const CaptinDrawerFailure({required this.message});
}
