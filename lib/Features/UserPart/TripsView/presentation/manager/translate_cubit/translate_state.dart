part of 'translate_cubit.dart';

sealed class TranslateState extends Equatable {
  const TranslateState();

  @override
  List<Object> get props => [];
}

final class TranslateInitial extends TranslateState {}

final class TranslateLoading extends TranslateState {}

final class TranslateSuccess extends TranslateState {
  final String translatedText;

  const TranslateSuccess({required this.translatedText});
}

final class TranslateFailure extends TranslateState {
  final String errMsg;

  const TranslateFailure({required this.errMsg});
}
