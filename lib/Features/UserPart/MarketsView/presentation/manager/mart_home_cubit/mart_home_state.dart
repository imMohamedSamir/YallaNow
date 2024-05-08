part of 'mart_home_cubit.dart';

sealed class MartHomeState extends Equatable {
  const MartHomeState();

  @override
  List<Object> get props => [];
}

final class MartHomeInitial extends MartHomeState {}

final class MartHomeLoading extends MartHomeState {}

final class MartHomeSuccess extends MartHomeState {
  final List<MartsModel> marts;

  const MartHomeSuccess({required this.marts});
}

final class MartHomeFailure extends MartHomeState {
  final String errMsg;

  const MartHomeFailure({required this.errMsg});
}
