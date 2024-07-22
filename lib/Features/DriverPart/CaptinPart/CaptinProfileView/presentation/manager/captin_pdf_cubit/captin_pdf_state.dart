part of 'captin_pdf_cubit.dart';

sealed class CaptinPdfState extends Equatable {
  const CaptinPdfState();

  @override
  List<Object> get props => [];
}

final class CaptinPdfInitial extends CaptinPdfState {}

final class CaptinPdfLoading extends CaptinPdfState {}

final class CaptinPdfSuccess extends CaptinPdfState {
  final Uint8List pdf;

  const CaptinPdfSuccess({required this.pdf});
}

final class CaptinPdfFailure extends CaptinPdfState {
  final String errMsg;

  const CaptinPdfFailure({required this.errMsg});
}
