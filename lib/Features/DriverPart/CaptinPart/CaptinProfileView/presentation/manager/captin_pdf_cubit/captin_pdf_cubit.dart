import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/data/repo/CatpinProfileRepo.dart';

part 'captin_pdf_state.dart';

class CaptinPdfCubit extends Cubit<CaptinPdfState> {
  CaptinPdfCubit(this._catpinProfileRepo) : super(CaptinPdfInitial());
  final CatpinProfileRepo _catpinProfileRepo;
  void get() async {
    emit(CaptinPdfLoading());
    var result = await _catpinProfileRepo.captinPapers();
    result.fold((fail) => emit(CaptinPdfFailure(errMsg: fail.errMessage)),
        (pdf) => emit(CaptinPdfSuccess(pdf: pdf)));
  }
}
