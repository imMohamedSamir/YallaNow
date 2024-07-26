part of 'prom_code_cubit.dart';

sealed class PromCodeState extends Equatable {
  const PromCodeState();

  @override
  List<Object> get props => [];
}

final class PromCodeInitial extends PromCodeState {}

final class PromCodeLoading extends PromCodeState {}

final class PromCodeApplied extends PromCodeState {}

final class PromCodeCancelled extends PromCodeState {}

final class PromCodeFailure extends PromCodeState {
  final String errMsg;

  const PromCodeFailure({required this.errMsg});
}
